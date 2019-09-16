classdef NNCS < handle
    %Neural network control system class
    %Use the code in nvv in a simplified version
    %Weiming Xiang: 2/20/2019
    
    properties
        controller = []; % nerual-network controller
        plant = []; % plant model, could be linear, nonlinear or neural network-based plant
        feedbackMap = []; % a feedback matrix decribes the mapping from a group of
        % outputs of the plant to a group of inputs of the controller
        
        % nerual network control system architecture
        %
        %              ---> plant ---> y(t) ---sampling--->y(k)
        %             |                                       |
        %             |                                       |
        %             u(k) <---- controller |<---- y(k-d)-----(output feedback)
        %                                   |<----- v(k)------(reference input)
        
        
        % the input to neural net controller is grouped into 2 group
        % the first group contains all the reference inputs
        % the second group contains all the output feedback with delays
        
        % feedbackMap = [0;1], a 2 x 1 matrix, means that:
        % the output feedback to the controller are: [y[k]; y[k-1]]
        
        % the first layer weight matrix of the controller is decomposed into two
        % submatrices: W = [W1 W2] where
        %              W1 is conresponding to I1 = v[k] (the reference input)
        %              W2 is conresponding to I2 = [y[k]; y[k-1]] (the feedback inputs)
        
        % the reach set of the first layer of the controller is:
        %              R = f(W1 * I1 + W2 * I2 + b), b is the bias vector of
        %              the first layer, f is the activation function
        nO = []; % number of output
        nI = []; % number of inputs = size(I1, 1) + size(I2, 1)
        nI_ref = []; % number of reference inputs
        nI_fb = []; % number of feedback inputs
        
        % used for reachable set computation
        ref_I = []; % reference input set
        init_set = []; % initial set for the plant
        options = []; % option for recahable set computation
    end
    
    methods
        
        %constructor
        function obj = NNCS(controller, plant, feedbackMap)
            % @controller: a neural net controller
            % @plant: a plant model (a LinearODE, DLinearODE or Neural net)
            % @feedbackMap: a feedback map from outputs of the plant to the
            % input of the controller
            
            % author: Dung Tran
            % date: 11/1/2018
            [~,controller_input] = size(controller.weight{1});
            [nO, nI] = size(feedbackMap);
            
            if nI ~= 1
                error('FeedbackMap should have one column');
            end
            if nO * plant.nO > controller_input
                error('Two many feedback inputs');
            end
            
            obj.controller = controller;
            obj.plant = plant;
            obj.feedbackMap = feedbackMap;
            obj.nO = plant.nO;
            obj.nI = controller_input;
            obj.nI_fb = nO * plant.nO;
            obj.nI_ref = obj.nI - obj.nI_fb;
            obj.options.timeStep_cora = 0.01;
            obj.options.sample = 0.1;
            obj.options.time = 10;
            obj.options.numSim = 100;
            obj.options.tol = 0.1;
            obj.options.approach = 'sim';
        end
        
        %set timeStep_cora for plant
        function set_timeStep_cora(obj, timeStep_cora)
            if timeStep_cora < 0
                error('Invalid timeStep_cora');
            end
            obj.options.timeStep_cora = timeStep_cora;
        end
        
        %set sampling period
        function set_sample(obj, sample)
            if sample < 0
                error('Invalid sample time');
            end
            obj.options.sample = sample;
        end
        
        %set computation time
        function set_time(obj, time)
            if time < 0
                error('Invalid computation time');
            end
            obj.options.time = time;
        end
        
        
        %set simulation number for neural network controller
        function set_numSim(obj, numSim)
            if numSim < 0
                error('Invalid simulation number');
            end
            obj.options.numSim = numSim;
        end
        
        %set tolerance for neural network controller
        function set_tol(obj, tol)
            if tol < 0
                error('Invalid tolerance');
            end
            obj.options.tol = tol;
        end
        
        %set output set computation approach for neural network
        function set_approach(obj, approach)
            obj.options.approach = approach;
        end
        
        % main reachability analysis method
        function [R, reachTime] = reach(obj, init_set, ref_inputSet)
            
            % @init_set: initial set, zonotope
            % @ref_inputSet: reference input set, interval
            % @n_steps: number of reachability analysis steps
            
            % author: Weiming Xiang
            % date: 2/20/2019
            
            start_time = tic;
            
            if obj.options.time < 0
                error('Computation time should be > 0');
            end
            
            obj.init_set = init_set;
            obj.ref_I = ref_inputSet;
            n_step = floor(obj.options.time/obj.options.sample);
            left_time = obj.options.time - n_step*obj.options.sample;
            
            %For the sampling interval [t0, t1], output of controller is 0,
            %compute the reachable set of the plant.
            fprintf('compute step 1 for interval [0,%f]\n',obj.options.sample);
            zero_set = zonotope(zeros(length(obj.controller.bias{end})));
            [R, R_step] = reach_zono(obj.plant, init_set, zero_set, ...
                obj.options.timeStep_cora, obj.options.sample);
            R_step_output = obj.plant.C*R_step;
            R_step_output_interval = intervalCompute.zono2interval(R_step_output);
            
            
            %compute the NNSC reachable set for n_step sampling periods
            for i=1:n_step-1
                fprintf('compute step %d for interval [%f,%f]\n', ...
                    i+1,i*obj.options.sample,(i+1)*obj.options.sample)
                % reachability analysis for  controller, note that the
                % input of the neural network is [ref input, feedback
                % input] for different problem, the order of ref and
                % feedback may be different!
                [U,~] = outputSet(obj.controller,[ref_inputSet;R_step_output_interval],...
                    obj.options);
                U_interval = intervalCompute.boundInterval(U.overApprox);
                U_zono = intervalCompute.interval2zono(U_interval);
                
                % reachability analysis for plant
                [Rx, R_step] = reach_zono(obj.plant, R_step,...
                    U_zono, obj.options.timeStep_cora, ...
                    obj.options.sample);
                R_step_output = obj.plant.C*R_step;
                R_step_output_interval = intervalCompute.zono2interval(R_step_output);
                R = vertcat(R, Rx);
            end
            
            if left_time > 0
                %compute reachable set for the rest time after the last
                %sampling instant [t_{n_step},t_{n_step} + left_time]
                fprintf('compute the last interval [%f,%f]\n', ...
                    n_step*obj.options.sample,obj.options.time);
                [U,~] = outputSet(obj.controller,[ref_inputSet,R_step],...
                    obj.options);
                U_interval = intervalCompute.boundInterval(U.overApprox);
                U_zono = intervalCompute.interval2zono(U_interval);
                
                [Rx, ~] = reach_zono(obj.plant, R_step, U_zono, ...
                    obj.options.timeStep_cora, left_time);
                R = {R, Rx};
            end
            reachTime = toc(start_time);
        end
        
        function [t,x] = evaluate(obj, x0, ref_input)
            if obj.options.time < 0
                error('Computation time should be > 0');
            end
            
            n_step = floor(obj.options.time/obj.options.sample);
            left_time = obj.options.time - n_step*obj.options.sample;
            
            %For the sampling interval [t0, t1], output of controller is 0,
            %compute the trace of the plant.
            zero_input = zeros(length(obj.controller.bias{end}));
            tspan = [0,obj.options.sample];
            [t,x] = evaluate(obj.plant, tspan, x0, zero_input);
            x_k = x(end,:);
            y_k = obj.plant.C*x_k';
            
            %compute the trace for n_step sampling periods
            for i=1:n_step-1
                % output for controller at t_k
                u = outputSingle(obj.controller,[ref_input';y_k]);
                
                % trace for plant
                tspan = [i*obj.options.sample,(i+1)*obj.options.sample];
                [t_temp,x_temp] = evaluate(obj.plant, tspan, x_k, u);
                x_k = x_temp(end,:);
                y_k = obj.plant.C*x_k';
                
                x = vertcat(x, x_temp);
                t = vertcat(t, t_temp);
            end
            
            if left_time > 0
                %compute trace for the rest time after the last
                %sampling instant [t_{n_step},t_{n_step} + left_time]
                u = outputSingle(obj.controller,[ref_input';y_k]);
                tspan = [n_step*obj.options.sample, obj.options.time];
                [t_temp,x_temp] = evaluate(obj.plant, tspan, x_k, u);
                
                x = vertcat(x, x_temp);
                t = vertcat(t, t_temp);
            end
        end
        
        function [t,x] = sample(obj, init_set, ref_inputSet, numSample)
            
            init_sample = intervalCompute.randomPoint(init_set, numSample);
            ref_sample = intervalCompute.randomPoint(ref_inputSet, numSample);
            
            for i = 1:numSample
                [t{i},x{i}] = obj.evaluate(init_sample(:,i), ref_sample(:,i)');
            end
            
        end
        
    end
end
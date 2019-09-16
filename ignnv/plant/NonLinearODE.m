classdef NonLinearODE < handle
    % Nonlinear ODE class is a grapper of nonlinearSys class in CORA
    % Most are copied from nnv tool
    
    properties
        options = []; % option for recahable set computation
        dynamics_func = []; % function to describe dynamics of the system
        dim = []; % dimension of the system (number of state variable)
        nI = []; % number of control inputs
        nO = []; % number of outputs
        C; % output matrix y = Cx
        
        %intermediate_reachSet = []; % intermediate reachable set between steps
        % this is used to store all intermediate reachable sets of NNCS
    end
    
    methods
        
        % constructor
        function obj = NonLinearODE(dim, nI, dynamics_func)
            % construct nonLinearODE plant
            % @dim: dimension of the plant
            % @nI: number of input
            % @dynamics_func: dynamics of the plant, the input should have
            % @ character to specify function, for example @car_dynamics
            
            % author: Dung Tran
            % date: 11/19/2018
            
            % Note: we construct a nonLinearODE plant with default option
            
            if dim < 1
                error('Dimension should be >=1');
            end
            
            if nI < 0
                error('Number of inputs should be >= 0');
            end
            
            obj.dim = dim;
            obj.nI = nI;
            obj.dynamics_func = dynamics_func; 
            
            % default option
            option.tStart = 0;
            option.tFinal = 0.1; % we provide method to change the option
            
            option.x0 = [];
            option.R0 = []; % initial set for reachability analysis
            option.timeStep = 0.01; % time step for reachable set computation
            option.taylorTerms = 4; % number of taylor terms for reachable sets
            option.zonotopeOrder = 2; % zonotope order
            option.intermediateOrder = 5; 
            option.reductionTechnique = 'girard';
            option.errorOrder = 1;
            option.polytopeOrder = 2; % polytope order
            option.reductionInterval = 1e3;
            option.maxError = 0.5*ones(dim, 1);
            option.advancedLinErrorComp = 0;
            option.tensorOrder=2;
            option.uTrans = 0;
            
            obj.options = option; % default option
            
        end
        
        % set taylor terms
        function set_taylorTerms(obj, taylorTerms)
            
            if taylorTerms < 1
                error('Invalid Taylor Terms');
            end
            obj.options.taylorTerms = taylorTerms;
        end
        
        % set zonotope order
        function set_zonotopeOrder(obj, zonotopeOrder)
            if zonotopeOrder < 1
                error('Invalid zonotope order');
            end
            
            obj.options.zonotopeOrder = zonotopeOrder;
            
        end
        
        % set intermediate order
        function set_intermediateOrder(obj, intermediateOrder)
            if intermediateOrder < 1
                error('Invalid intermediate order');
            end
            
            obj.options.intermediateOrder = intermediateOrder;
            
        end
        
        % set reduction technique
        function set_reductionTechnique(obj, reductionTechnique)
            obj.options.reductionTechnique = reductionTechnique;
        end
        
        % set error order
        function set_errorOrder(obj, errorOrder)
            if errorOrder < 1
                error('Invalid error order');
            end
            
            obj.options.errorOrder = errorOrder;
        end
        
        % set polytope Order
        function set_polytopeOrder(obj, polytopeOrder)
            
            if polytopeOrder < 1
                error('Invalid polytope order');
            end
            
            obj.options.polytopeOrder = polytopeOrder;
        end
        
        % set reduction Interval
        function set_reductionInterval(obj, reductionInterval)
            
            if reductionInterval < 0
                error('Invalid reduction interval');
            end
            
            obj.options.reductionInterval = reductionInterval;
            
        end
        
        % set max Error       
        function set_maxError(obj, maxError)
            
            if size(maxError, 1) ~= obj.dim && size(maxError, 2) ~= 1
                error('Invalid max error');
            end
            
            obj.options.maxError = maxError;
            
        end
        
        % set tensor Order
        function set_tensorOrder(obj, tensorOrder)
            if tensorOrder < 1
                error('Invalid tensor Order');
            end
            
            obj.options.tensorOrder = tensorOrder;
            
        end
        
        % set originContained
        function set_originContained(obj, originContained)
            obj.options.originContained = originContained;
        end
        
        % set advancedLinErrorComp
        function set_advancedLinErrorComp(obj, advancedLinErrorComp)
            obj.options.advancedLinErrorComp = advancedLinErrorComp;
        end
        
        % set plot Type
        function set_plotType(obj, plotType)
            obj.options.plotType = plotType;
        end
        
        % set uTrans
        function set_uTrans(obj, uTrans)
            obj.options.uTrans = uTrans;
        end
        
        % set input set U
        function set_U(obj, U)
            obj.options.U = U;
        end
        
        % set initial set
        function set_R0(obj, R0)
            obj.options.R0 = R0;
        end
        
        % set tFinal
        function set_tFinal(obj, tFinal)
            if tFinal <= 0
                error('tFinal should be > 0');
            end
            obj.options.tFinal = tFinal;
        end
        
        % set tStart
        function set_tStart(obj, tStart)
            
            if tStart < 0
                error('Invalid tStart');
            end
            
            obj.options.tStart = tStart;
        end
        
        % set inital state for simulation x0
        function set_x0(obj, x0)
            if length(x0) ~= obj.dim
                error('Dimension mismatch between initial state and the system');
            end
            
            obj.options.x0 = x0;
        end
        
        % set time step 
        function set_timeStep(obj, timeStep)
            if timeStep <= 0
                error('Invalid time step');
            end
            obj.options.timeStep = timeStep;
        end
        
        % set output matrix
        function set_output_mat(obj, output_mat)
            if size(output_mat, 2) ~= obj.dim
                error('Invalid output matrix');
            end
            
            obj.nO = size(output_mat, 1);
            obj.C = output_mat;
        end
        
    end
    
    
    % reachability anlaysis method
    methods
        
        % reachability analysis using zonotope
        function [R, final_R] = reach_zono(obj, init_set, input_set, timeStep, tFinal)
           % @init_set: initial set of state
           % @input_set: input set u
           % @timeStep: time step in reachable set computation
           % @num_steps: number of steps in reachable set computation
           % @R: reachable set, zonotopes
           % @final_R: last reachable set, zonotope
           
           % this is a grapper of reach method for nonlinear system in CORA
           % the initial set and input set are Zono in nnv
           
           % author: Dung Tran
           % date: 11/20/2018
           
%            if ~isa(init_set, 'Zono')
%                error('Initial set is not a zonotope');
%            end
%            
%            if ~isa(input_set, 'Zono')
%                error('Input set is not a zonotope');
%            end
           
           obj.set_R0(init_set);
           obj.set_U(input_set);
           obj.set_timeStep(timeStep);
           obj.set_tFinal(tFinal);
           
           sys = nonlinearSys(obj.dim, obj.nI, obj.dynamics_func, obj.options); % CORA nonlinearSys class
           R = reach(sys, obj.options); % CORA reach method using zonotope and conservative linearization
           final_R = R{length(R),1}{1,1};  % The final zonotope at tFinal 
           %final_R_interval = intervalCompute.zono2interval(final_R);% The final interval at tFinal
        end

        % evaluate (simulate) the plant with specific input and state
        % using ode45 solver
        function [t, y] = evaluate(obj, tspan, x0, u)
            % @x0: initial state
            % @u: control input
            % @tspan: time points
            
            % author: Dung Tran
            % date: 1/29/2019
            
            [t, y] = ode45(@(t,x) obj.dynamics_func(t, x, u), tspan, x0);          
            
        end

        
    end
    
end
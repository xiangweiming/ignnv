function [R, reachTime] = reach(obj, init_set, ref_inputSet)
% main reachability computation function
%
% Syntax:
% [R, reachTime] = reach(obj, init_set, ref_inputSet)
%
% Inputs:
%    obj - neural network control system object
%    init_set - initial set, zonotope object
%    ref_inputSet - reference input set, interval matrix
%
% Outputs:
%    R - reachable set, zonotope objects
%    reachTime - computation time

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

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

% computer for the 1st period using reach_zono function which is in CORA
[R, R_step] = reach_zono(obj.plant, init_set, zero_set, ...
    obj.options.timeStep_cora, obj.options.sample);
R_step_output = obj.plant.C*R_step;
R_step_output_interval = intervalCompute.zono2interval(R_step_output);


%compute the nncs reachable set for n_step sampling periods
for i=1:n_step-1
    fprintf('compute step %d for interval [%f,%f]\n', ...
        i+1,i*obj.options.sample,(i+1)*obj.options.sample)
    % reachability analysis for  controller, note that the
    % input of the neural network is [ref input, feedback
    % input] for different problem, the order of ref and
    % feedback may be different!
    U = outputSetSim(obj.controller,[ref_inputSet,R_step_output_interval],...
        obj.options.numSim,obj.options.tol);
    U_interval = intervalCompute.boundInterval(U.outer);
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
    U = outputSet_sim(obj.controller,[ref_inputSet,R_step],...
        obj.options.numSim,obj.options.tol);
    U_interval = intervalCompute.boundInterval(U.outer);
    U_zono = intervalCompute.interval2zono(U_interval);
    
    [Rx, ~] = reach_zono(obj.plant, R_step, U_zono, ...
        obj.options.timeStep_cora, left_time);
    R = {R, Rx};
end
reachTime = toc(start_time);
end

%------------- END CODE --------------
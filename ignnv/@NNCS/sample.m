function [t,x] = sample(obj, init_set, ref_inputSet, numSample)
% generate a number of trajectories
%
% Syntax:
% [t,x] = sample(obj, init_set, ref_inputSet, numSample)
%
% Inputs:
%    obj - neural network control system object
%    init_set - initial set, zonotope object
%    ref_inputSet - reference input set, interval matrix
%    numSample - number of trajectories
%
% Outputs:
%    t - time horizon
%    x - trajectories

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

% generate numSample trajectories
init_sample = intervalCompute.randomPoint(init_set, numSample);
ref_sample = intervalCompute.randomPoint(ref_inputSet, numSample);

for i = 1:numSample
    [t{i},x{i}] = obj.evaluate(init_sample(:,i), ref_sample(:,i)');
end

end

% generate a single trajectory
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

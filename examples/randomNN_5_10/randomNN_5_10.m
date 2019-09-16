clc
clear
load data_5_layer_10_neuron network
activeFun = network.activeType;
W = network.weight;
b = network.bias;

inputInterval = [-5,5; -5,5];
unsafeInterval  = [1,6;1,6];

ffnn = ffnetwork(W,b,activeFun);
generateFcn(ffnn);
fprintf('Generate interval computation file. Press enter to continue.\n');
pause;
tic

%% set parameters
% options.tol = 0.1;
% options.numSim = 1e5;
% options.segments = [5;5];
% options.simPoint = 'grid';
% options.approach = 'uniform';

%% specification-guided approach
options.approach = 'spec';
options.tol = 0.1;
tic
fprintf('Use specification-guided method to check safety ...\n')
[y, I] = outputSet(ffnn,inputInterval,unsafeInterval,options);
toc
% output computation results
figure; % input figure
hold on
if isfield(I,'outside')
    l_outside = length(I.outside);
    fprintf('%i safe input intervals. \n',l_outside);
    intervalCompute.plot(I.outside,'full','c') % plot safe input intervals
else
    l_outside = 0;
    fprintf('0 safe input interval. \n');
end

if isfield(I,'inside')
    l_inside = length(I.inside);
    fprintf('%i unsafe input intervals. \n',length(I.inside));
    intervalCompute.plot(I.inside,'full','red') % plot unsafe input intervals
else
    l_inside = 0;
    fprintf('0 unsafe input intervals. \n');
end
title({['Input interval classification based on specification-guided method']; ...
    ['Intervals: ', num2str(l_outside), '(safe)']})
xlabel('x_1')
ylabel('x_2')

figure % output figure
hold on
if isfield(y,'outside')
    l_outside = length(y.outside);
    fprintf('%i safe output intervals. \n',l_outside);
    intervalCompute.plot(y.outside,'full','c') % plot safe output intervals
else
    l_outside = 0;
    fprintf('0 safe output interval. \n');
end

if isfield(y,'inside')
    l_inside = length(y.inside);
    fprintf('%i unsafe output intervals. \n',length(I.inside));
    intervalCompute.plot(y.inside,'full','red') % plot unsafe input intervals
else
    l_inside = 0;
    fprintf('0 unsafe output intervals. \n');
end
title({['Output intervals based on specification-guided method']; ...
    ['Intervals: ', num2str(l_outside), '(safe), ', ...
    num2str(l_inside), '(unsafe)']})
xlabel('x_1')
ylabel('x_2')


%% backward approach
options.approach = 'back';
tic
fprintf('Use backward-guided method to check safety ...\n')
[y,I] = outputSet(ffnn,inputInterval,unsafeInterval,options);
toc

% output computation 
figure;
hold on
if isfield(I,'outside')
    l_outside = length(I.outside);
    fprintf('%i safe input intervals. \n',l_outside);
    intervalCompute.plot(I.outside,'full','c') % plot safe input intervals
else
    l_outside = 0;
    fprintf('0 safe input interval. \n');
end

if isfield(I,'inside')
    l_inside = length(I.inside);
    fprintf('%i unsafe input intervals. \n',length(I.inside));
    intervalCompute.plot(I.inside,'full','yellow') % plot unsafe input intervals
else
    l_inside = 0;
    fprintf('0 unsafe input intervals. \n');
end

if isfield(I,'intersect')
    l_intersect = length(I.intersect);
    fprintf('%i uncertain input intervals. \n',l_intersect);
    intervalCompute.plot(I.intersect,'full','red') % plot uncertain input intervals
else
    l_intersect = 0;
    fprintf('0 uncertain input interval. \n');
end

title({['Input interval classification based on backward-guided method']; ...
    ['Intervals: ', num2str(l_outside), '(safe), ', ...
    num2str(l_inside), '(unsafe), ', ...
    num2str(l_intersect), '(unceratin)']})
xlabel('x_1')
ylabel('x_2')






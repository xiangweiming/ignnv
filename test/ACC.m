clc
clear

load controller

numLayer = length(controller.layers);

%get activation function for each layer
for i = 1:numLayer
    activeFun{i} = controller.layers{i}.transferFcn;
    b{i} = controller.b{i};
end

W{1} = controller.IW{1};
for i = 2:numLayer
    W{i} = controller.LW{i,i-1};
end

Controller = ffnetwork(W,b,activeFun); % feedforward neural network controller
generateFcn(Controller);
fprintf('Generate interval computation file. Press enter to continue.\n');
pause;

Plant = NonLinearODE(6, 1, @car_dynamics);
output_mat = [0 0 0 0 1 0;1 0 0 -1 0 0; 0 1 0 0 -1 0]; % feedback: relative distance, relative velocity and ego-car velocity
Plant.set_output_mat(output_mat); % Define the outputs that is feedback to the controller

feedbackMap = [0]; % feedback map, y[k] 

ncs = NNCS(Controller, Plant, feedbackMap); % the neural network control system
% initialize the parameters
time = 10;  % computation time
sample_time = 0.5; %sampling time
timeStep_cora = 0.01;
numSim = 1e5;
tol = 0.1;
approach = 'sim';

ncs.set_time(time);
ncs.set_sample(sample_time);
ncs.set_timeStep_cora(timeStep_cora);
ncs.set_numSim(numSim);
ncs.set_approach(approach);

% initial condition of the Plant

% x = [x_lead v_lead x_internal_lead x_ego v_ego x_internal_ego]'

lb = [94, 32, 0, 10, 30, 0]';
ub = [96, 32.2, 0, 11, 30.2, 0]';

init_set_interval = [lb,ub];
init_set = intervalCompute.interval2zono(init_set_interval);

% reference input for neural network controller
% t_gap = 1.4; v_set = 30;

lb1 = [30, 1.4]';
ub1 = [30, 1.4]';

input_ref = [lb1, ub1];

map = [1 0 0 -1 0 0; 0 0 0 0 1 0]; % get distance between two cars and velocity of ego car

[R, reachTime] = reach(ncs, init_set, input_ref);

% plot output relative distance, ego_car velocity and safe_distance
% distance between two cars
% dis = x_lead - x_ego 

% safe distance between two cars, see here 
% https://www.mathworks.com/help/mpc/examples/design-an-adaptive-cruise-control-system-using-model-predictive-control.html

% dis_safe = D_default + t_gap * v_ego;
% the safety specification is: dis >= 0.9 * dis_safe

% x = [x_lead v_lead a_lead acc2 x_ego v_ego]'
t_gap = 1.4;
D_default = 10;

alp = 1;
map1 = [0 0 0 0 alp*t_gap 0; 0 0 0 0 1 0]; % safe distance and velocity of ego car

% safety specification: distance > alp * safe_distance
figure
map = [1 0 0 -1 0 0; 0 0 0 0 1 0]; % get distance between two cars and velocity of ego car
map1 = [0 0 0 0 alp*t_gap 0; 0 0 0 0 1 0];
n_R = length(R);
for i = 1:n_R
    actual_distance{i} = map*R{i}{1};
    safe_distance{i} = map*R{i}{1}+[alp*D_default; 0];
end

for i = 1:n_R
    plot(actual_distance{i});
    %plot(safe_distance{i},[1,2],'r');
    hold on
end

numSample = 1000;

[t,x] = sample(ncs, init_set_interval, input_ref, numSample);

for i = 1:length(x)
    n_x = length(x{i});
    for j = 1:n_x
        trace{i}(j,:) = transpose(map*x{i}(j,:)');
    end
    plot(trace{i}(:,1),trace{i}(:,2),'-')
    hold on
end

for i = 1:length(actual_distance)
    actual_distance_interval{i} = intervalCompute.zono2interval(actual_distance{i});
end

for i = 1:2
    figure
    t_sample = 0:time/(length(actual_distance)-1):time;
    intervalCompute.plotPipe(t_sample,actual_distance_interval,i,'b','b')
    hold on
    for j = 1:length(x)
        plot(t{j},trace{j}(:,i))
        hold on
    end
end








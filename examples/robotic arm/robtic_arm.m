clc
clear
load data_robot network
activeFcn = network.activeType;
W = network.weight;
b = network.bias;
numSim = 1000;

inputInterval = [-5,5; -5,5];
inputInterval = [pi/3,2*pi/3; pi/3,2*pi/3];

ffnn = ffnetwork(W,b,activeFcn);
generateFcn(ffnn);
fprintf('Generate interval computation file. Press enter to continue.\n');
pause;

%% set parameters
% options.tol = 0.1;
% options.numSim = 1e5;
% options.segments = [5;5];
% options.simPoint = 'grid';
% options.approach = 'uniform';

%% uniform partition method
tic
options.tol = 0.1;
[y,~] = outputSet(ffnn,inputInterval,options); % uniform partition method using defaut options
toc
l_uniform = length(y);
fprintf('Use uniform partition method to generate %i output intervals.\n',l_uniform)
figure
hold on
intervalCompute.plot(y,'empty','b')
y_boundInterval_uniform = intervalCompute.boundInterval(y);
intervalCompute.plot(y_boundInterval_uniform,'empty','black')
y = outputRandom(ffnn,inputInterval,numSim);
plot(y(1,:),y(2,:),'r.')
title({['Output sets based on uniform partition method'];[num2str(l_uniform), ' output intervals']})
xlabel('y_1') 
ylabel('y_2') 


%% simulation-guided method
options.approach = 'sim';
options.numSim = 1e5;
%options.simPoint = 'grid';
%options.segments = [100;100];
options.tol = 0.01;
tic
[y,I] = outputSet(ffnn,inputInterval,options); % simulation-guided method
toc
l_sim = length(y.overApprox);
fprintf('Use simulation-guided method to generate %i output intervals.\n',l_sim)
figure
hold on
intervalCompute.plot(y.overApprox,'empty','b')
y_boundInterval_sim = intervalCompute.boundInterval(y.overApprox);
intervalCompute.plot(y_boundInterval_sim,'empty','black')
y = outputRandom(ffnn,inputInterval,numSim);
plot(y(1,:),y(2,:),'r.')
title({['Output sets based on simulation-guided method'];[num2str(l_sim), ' output intervals']})
xlabel('y_1') 
ylabel('y_2') 
figure
hold on
intervalCompute.plot(I.overApprox,'empty','b')
title({['Input intervals based on simulation-guided method'];[num2str(l_sim), ' Input intervals']})
xlabel('x_1') 
ylabel('x_2') 








clc 
clear 
load data
xInterval = [1.5 2.5];
uInterval = [0 1];
inputInterval = [xInterval; uInterval];
activeFcn = network.activeType;
W = network.weight;
b = network.bias;

ffnn = ffnetwork(W,b,activeFcn);

generateFcn(ffnn);
fprintf('Generate interval computation file. Press enter to continue.\n');
pause;

%% Uniform partition method
% options.tol = 0.05;
% K = 50;
% for k = 0:1:K
%     yInterval{k+1} = inputInterval;
%     [y,~] = outputSet(ffnn,inputInterval,options);
%     inputInterval = [intervalCompute.boundInterval(y); 0.8,1.2];
% end
% time = 0:1:K;
% intervalCompute.plotPipe(time,yInterval,1,'b','b')
%% Simulation method
options.approach = 'sim';
options.numSim = 1e3;
options.tol = 0.1;
[dim,~] = size(inputInterval);
options.segments = 10*ones(dim,1);
options.simPoint = 'random'; 
color = 'y'

tic
K = 100;
yInterval = outputSetNARMA(ffnn,xInterval,uInterval,K,options);
toc
time = 0:1:K;
intervalCompute.plotPipe(time,yInterval,1,color,color)
hold on
%% Generate random single y 
inputInterval = [uInterval;xInterval];
numSim = 1;
for i = 1:1:numSim
    input = intervalCompute.randomPoint(inputInterval,1);
    for k = 0:1:K
        ySingle(k+1) = input(2,1);
        output = outputSingle(ffnn,input);
        input = [intervalCompute.randomPoint(uInterval,1);output];
    end
    time = 0:1:K;
    plot(time,ySingle,'r')
end


xlabel('k') 
ylabel('Position y(k)') 






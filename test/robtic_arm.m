clc
clear
%load data_5_layer_10_neuron network
load data_robot network
activeFcn = network.activeType;
W = network.weight;
b = network.bias;
tol = 0.1;
numSim = 1000;


% unsafeInterval = [-14,1;3,17];

inputInterval = interval([-5;-5],[5;5]);
% target  = [1,1;6,6];

%inputInterval= [-3,-5;3,1];
%target = [-0.5,-0.5;0.5,0.5];

ffnn = ffnetwork(W,b,activeFcn);
generateFcn(ffnn);
fprintf('Generate interval computation file. Press enter to continue.\n');
pause;
%[y,I] = outputSet_spec(ffnn,inputInterval,unsafeInterval,tol);
%[y,I] = outputSet_sim(ffnn,inputInterval,numSim,tol);
[y,I] = outputSetUniform(ffnn,inputInterval,tol);
%[y,I] = outputSet_inv(ffnn,inputInterval,target,tol);
%[y,I] = ffnetwork.outputSet_inv(inputInterval,target,tol)

intervalCompute.squareplot(y.outer,'b','empty')
% hold on
% y_box = interval.boxSet(y.outer);
% interval.squareplot(y_box,'b','empty')
% figure;
% interval.squareplot(I.intersect,'b','full')
% interval.squareplot(I.outside,'c','full')
%interval.squareplot(I.inside,'r','full')
%figure
%interval.squareplot(I.outer,'g','full')

%interval.squareplot(y,'r','empty')

y = outputRandom(ffnn,inputInterval,numSim);
plot(y(1,:),y(2,:),'.')
hold on
figure
intervalCompute.squareplot(I.outer,'b','empty')





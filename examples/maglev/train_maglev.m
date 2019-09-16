
clear all
clc

load training_data.mat

N = 3500; %3500 data for training
P_train = xs(1:N,:)';
T_train = t(1:N,:)';
P_test = xs(N:end,:)';
T_test = t(N:end,:)';
N = size(P_test,2);
numLayer = 10;

net = newff(P_train,T_train,numLayer);

net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-5;
net.trainParam.lr = 0.01;

net = train(net,P_train,T_train);
network.weight{1} = net.IW{1};
network.weight{2} = net.LW{2,1};
network.bias{1} = net.b{1};
network.bias{2} = net.b{2};
network.activeType = {'tansig'  'purelin'};
save data network


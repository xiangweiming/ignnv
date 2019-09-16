function y = outputRandom(obj,inputSet,num)
% generate outputs for random points in an input interval or zonotope
%
% Syntax:
% y = outputRandom(obj,inputSet,num)
%
% Inputs:
%    obj - feedforward object
%    inputSet - interval matrix or zonotope object
%    num - number of inputs/outputs, a scalar
% Outputs:
%    y - outputs
% Example:
%    ffnn = ffnetwork(W,b,activeFcn);
%    I = [0, 1;
%         0, 1];
%    num = 100;
%    y = outputRandom(ffnn,I,num);
%

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

if isa(inputSet, 'zonotope')
    y = zeros(inputSet.dim,num);
    for i = 1:1:num
        y(:,i) = outputSingle(obj,randPoint(inputSet));
    end
else
    [dim,~] = size(inputSet);
    y = zeros(dim,num); % pre-allocate memory
    
    for i = 1:1:num
        inputPoint = zeros(dim,1);
        for n = 1:1:dim
            inputPoint(n,:) = inputSet(n,1) + (inputSet(n,2)-inputSet(n,1))*rand;
        end
        y(:,i) = outputSingle(obj,inputPoint);
    end
end

end

%------------- END OF CODE --------------
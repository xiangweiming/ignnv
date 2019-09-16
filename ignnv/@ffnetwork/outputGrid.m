function y = outputGrid(obj,inputIntvl,segments)
    % generate outputs for gridding point in an input interval
    %
    % Syntax:
    % outputGrid(obj,inputIntvl,segments)
    %
    % Inputs:
    %    obj - feedforward object
    %    inputIntvl - interval matrix
    %    segments - number of segments for each dimension (scalar of column vector)
    % Outputs:
    %    y - outputs
    % Example:
    %    ffnn = ffnetwork(W,b,activeFcn);
    %    I = [0, 1;
    %         0, 1];
    %    segments = [10;10];
    %    y = outputGrid(ffnn,I,segments);
    %
    
    % Author:       Weiming Xiang
    % Written:      02/25/2019
    % Last update:  02/25/2019
    
%------------- BEGIN CODE --------------
lb = inputIntvl(:,1);
ub = inputIntvl(:,2);
inputIntvl = interval(lb,ub);
gridInput = gridPoints(inputIntvl, segments); % get the griding input, gridPoints is from CORA
[dim,numInput] = size(gridInput); 
y = zeros(dim,numInput); % pre-allocate y in memory
for i = 1:1:numInput
    y(:,i) = outputSingle(obj,gridInput(:,i));
end

end

%------------- END OF CODE --------------
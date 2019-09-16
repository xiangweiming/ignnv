function y = activation(x,activeFcn) 
    % activation function
    %
    % Syntax:
    % y = activation(x,activeFcn) 
    %
    % Inputs:
    %    x - input x, vector
    %    activeFcn - type of activation function, string
    %
    % Outputs:
    %    y - output of activation function
    %
    
    % Author:       Weiming Xiang
    % Written:      02/25/2019
    % Last update:  02/25/2019
    
%------------- BEGIN CODE --------------

switch activeFcn
    case 'tansig'
        y = tansig(x);
    case 'logsig'
        y = logsig(x);
    case 'purelin'
        y = purelin(x);
    case 'poslin'
        y = poslin(x);
end
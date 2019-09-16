function outputIntvl = outputSetSingle(obj,inputIntvl)
    % computer an output set for a single input interval
    %
    % Syntax:
    % y = outputSetSingle(obj,inputIntvl)
    %
    % Inputs:
    %    obj - feedforward network object
    %    inputIntvl - interval matrix
    %
    % Outputs:
    %    outputIntvl - output matrix
    %
    
    % Author:       Weiming Xiang
    % Written:      02/25/2019
    % Last update:  02/25/2019
    
%------------- BEGIN CODE --------------

numLayer = length(obj.bias);

for i = 1:1:numLayer
    inputIntvl = layerOutputSet(obj,inputIntvl,i); % layer-by-layer computation
end

outputIntvl = inputIntvl;

end

%------------- END OF CODE --------------
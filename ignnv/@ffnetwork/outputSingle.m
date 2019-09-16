function y = outputSingle(obj,x)
    % computer a single output for a feedforward neural network
    %
    % Syntax:
    % y = outputSingle(obj,x)
    %
    % Inputs:
    %    obj - feedforward object
    %    x - single input, x= [x1;x2;...;xn]
    %
    % Outputs:
    %    y - single output, y= [y1;y2;...;yn]
    %
    
    % Author:       Weiming Xiang
    % Written:      02/25/2019
    % Last update:  02/25/2019
    
%------------- BEGIN CODE --------------

layerNum = length(obj.bias);
for i=1:1:layerNum
    x =  activation(obj.weight{i}*x + obj.bias{i},obj.activeFcn{i});
end
y = x;

end

%------------- END OF CODE --------------
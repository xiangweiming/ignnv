function [outputIntvl_array,inputIntvl_array] = outputSetUniform(obj,inputIntvl,tol) 
    % computer an output set for a single input interval
    %
    % Syntax:
    % [outputIntvl_array,inputIntvl_array] = outputSetUniform(obj,inputIntvl,tol) 
    %
    % Inputs:
    %    obj - feedforward neural network object
    %    inputIntvl - interval matrix
    %    tol - tolerance for partition
    
    %
    % Outputs:
    %    outputIntvl_array - array of output interval matrices
    %    inputIntvl_array - array of input interval matrices
    
    % Author:       Weiming Xiang
    % Written:      02/25/2019
    % Last update:  02/25/2019
    
%------------- BEGIN CODE --------------

inputIntvl_array = intervalCompute.partition(inputIntvl,tol); % compute the uniform partion of an interval
num = length(inputIntvl_array);
outputIntvl_array = cell(1,num);
for i = 1:1:num
    outputIntvl_array{i} = outputSetSingle(obj,inputIntvl_array{i});
end

end

%------------- END OF CODE --------------
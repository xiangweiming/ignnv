function outputIntvl_array = outputSetNARMAUniform(obj,initialIntvl,inputIntvl,step,tol)
    % computer an output set of an NARMA model for a single input interval
    % using uniform method
    %
    % Syntax:
    % outputIntvl_array = outputIntvl_array = outputSetNARMAUniform(obj,initialIntvl,inputIntvl,step,tol)
    %
    % Inputs:
    %    obj - feedforward neural network object for NARMA model
    %    initialIntvl - initial state set (interval matrix)
    %    inputIntvl - input set (interval matrix)
    %    tol - tolerance for partition    
    %
    % Outputs:
    %    outputIntvl_array - array of output interval matrices
    
    % Author:       Weiming Xiang
    % Written:      09/13/2019
    % Last update:  09/13/2019
    
%------------- BEGIN CODE --------------
x = [inputIntvl;initialIntvl];
y = initialIntvl;
 for k = 0:1:step
    outputIntvl_array{k+1} = y;
    [y,~] = outputSetUniform(obj,x,tol);
    y = intervalCompute.boundInterval(y);
    x = [inputIntvl;y];
 end
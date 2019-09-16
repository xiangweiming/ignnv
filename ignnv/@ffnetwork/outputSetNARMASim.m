function outputIntvl_array = outputSetNARMASim(obj,initialIntvl,inputIntvl,step,options)
    % computer an output set of an NARMA model for a single input interval
    % using simulation-guided method
    %
    % Syntax:
    % function outputIntvl_array = outputSetNARMASim(obj,initialIntvl,inputIntvl,step,options)
    %
    % Inputs:
    %    obj - feedforward neural network object for NARMA model
    %    initialIntvl - initial state set (interval matrix)
    %    inputIntvl - input set (interval matrix)
    %    options:
    %       numSim - number of random simulations
    %       segment - number of grids
    %       tol - tolerance for partition
    %       approach - random simulation or grid points
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
    [y,~] = outputSetSim(obj,x,options);
    y = intervalCompute.boundInterval(y.overApprox);
    x = [inputIntvl;y];
 end
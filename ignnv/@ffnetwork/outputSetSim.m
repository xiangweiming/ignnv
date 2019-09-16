function [outputIntvl_array,inputIntvl_array] = outputSetSim(obj,inputIntvl,options)
% computer an output set for a single input interval
%
% Syntax:
% [outputIntvl_array,inputIntvl_array] = outputSetSim(obj,inputIntvl,options)
%
% Inputs:
%    obj - feedforward neural network object
%    inputIntvl - interval matrix
%    options:
%       numSim - number of random simulations
%       segment - number of grids
%       tol - tolerance for partition
%       approach - random simulation or grid points


%
% Outputs:
%    outputIntvl_array - array of output interval matrices
%    inputIntvl_array - array of input interval matrices

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

numSim = options.numSim;
segments = options.segments;
tol =  options.tol;
simPoint = options.simPoint;
outputIntvl_array.inside = {};
outputIntvl_array.intersect = {};
inputIntvl_array.inside = {};
inputIntvl_array.intersect = {};



switch simPoint
    case 'random'
        outputPoint = outputRandom(obj,inputIntvl,numSim);
    case 'grid'
        outputPoint = outputGrid(obj,inputIntvl,segments);
end

target = intervalCompute.boundPoint(outputPoint);
outputIntvl = outputSetSingle(obj,inputIntvl);
M{1}.input = inputIntvl;
M{1}.output = outputIntvl;
numM = 1;
numIntersect = 0;
numInside = 0;

while numM > 0
    tempM = M{1}; %select the first set in M
    M(1) = []; %remove the selected set
    intersectValue = intervalCompute.isIntersectInterval(tempM.output,target);
    if intersectValue == 1
        numInside = numInside+1;
        outputIntvl_array.inside{numInside} = tempM.output;
        inputIntvl_array.inside{numInside} = tempM.input;
        numM = numM-1;
    elseif intersectValue ~= 1
        if intervalCompute.terminate(tempM.input,tol) == 0
            [inputIntvl_1,inputIntvl_2] = intervalCompute.bisect(tempM.input);
            outputIntvl_1 = outputSetSingle(obj,inputIntvl_1);
            M{numM}.input = inputIntvl_1;
            M{numM}.output = outputIntvl_1;
            numM = numM+1;
            outputIntvl_2 = outputSetSingle(obj,inputIntvl_2);
            M{numM}.input = inputIntvl_2;
            M{numM}.output = outputIntvl_2;
        elseif intervalCompute.terminate(tempM.input,tol) == 1
            numIntersect = numIntersect+1;
            outputIntvl_array.intersect{numIntersect} = tempM.output;
            inputIntvl_array.intersect{numIntersect} = tempM.input;
            numM = numM-1;
        end
    end
end

outputIntvl_array.overApprox = [outputIntvl_array.inside,outputIntvl_array.intersect];
inputIntvl_array.overApprox = [inputIntvl_array.inside,inputIntvl_array.intersect];

end

%------------- END OF CODE --------------
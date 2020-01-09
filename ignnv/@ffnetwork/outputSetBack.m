function [outputIntvl_array,inputIntvl_array] = outputSetBack(obj,inputIntvl,targetIntvl,tol)
% compute the input set for the target interval set using BACKWARD COMPUTATION method
%
% Syntax:
% [outputIntvl_array,inputIntvl_array] = outputSetBack(obj,inputIntvl,target,tol)
%
% Inputs:
%    obj - feedforward neural network object
%    inputIntvl - interval matrix
%    targetIntvl - targeted output interval matrix
%    tol - tolerance for partition

%
% Outputs:
%    outputIntvl_array - array of output interval matrices
%    inputIntvl_array - array of input interval matrices

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

outputIntvl = outputSetSingle(obj,inputIntvl);
M{1}.input = inputIntvl;
M{1}.output = outputIntvl;
numM = 1;
numOutside = 0;
numIntersect = 0;
numInside = 0;

while numM > 0
    tempM = M{1}; %select the first set in M
    M(1) = []; %remove the selected set
    intersectValue = intervalCompute.isIntersectInterval(tempM.output,targetIntvl);
    if intersectValue == 0
        numOutside = numOutside+1;
        outputIntvl_array.outside{numOutside} = tempM.output;
        inputIntvl_array.outside{numOutside} = tempM.input;
        numM = numM-1;
    elseif intersectValue == 1
        numInside = numInside+1;
        outputIntvl_array.inside{numInside} = tempM.output;
        inputIntvl_array.inside{numInside} = tempM.input;
        numM = numM-1;
    elseif intersectValue == 2
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
if numInside == 0
    outputIntvl_array.overApprox = outputIntvl_array.intersect;
    inputIntvl_array.overApprox = inputIntvl_array.intersect;
else
    outputIntvl_array.overApprox = [outputIntvl_array.inside,outputIntvl_array.intersect];
    inputIntvl_array.overApprox = [inputIntvl_array.inside,inputIntvl_array.intersect];
end
end

%------------- END OF CODE --------------
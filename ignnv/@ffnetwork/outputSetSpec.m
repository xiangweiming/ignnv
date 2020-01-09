function [outputIntvl_array,inputIntvl_array] = outputSetSpec(obj,inputIntvl,unsafeIntvl,tol)
% compute the output set for an interval using SPECIFICATION-GUIDED method method
%
% Syntax:
% [outputIntvl_array,inputIntvl_array] = outputSetSpec(obj,inputIntvl,unsafeIntvl,tol)
%
% Inputs:
%    obj - feedforward neural network object
%    inputIntvl - interval matrix
%    unsafeIntvl - unsafe interval matrix
%    tol - tolerance for partition

%
% Outputs:
%    outputIntvl_array - array of safe output interval matrices
%    inputIntvl_array - array of safe input interval matrices

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

outputIntvl = outputSetSingle(obj,inputIntvl);
M{1}.input = inputIntvl;
M{1}.output = outputIntvl;
numM = 1;
numOutside = 0;
numInside = 0;

while numM > 0
    tempM = M{1}; %select the first set in M
    M(1) = []; %remove the selected set
    intersectValue = intervalCompute.isIntersectInterval(tempM.output,unsafeIntvl);
    if intersectValue == 0 %if the selected set is safe, record it
        numOutside = numOutside+1;
        outputIntvl_array.outside{numOutside} = tempM.output;
        inputIntvl_array.outside{numOutside} = tempM.input;
        numM = numM-1;
        if numM > 0
            continue;
        else
            fprintf('The neural network is safe with respect to unsafe region.\n');
            fprintf('The safety is guaranteed by %g interval sets.\n', length(outputIntvl_array));
        end
    elseif intersectValue == 1
        numInside = numInside+1;
        outputIntvl_array.inside{numInside} = tempM.output;
        inputIntvl_array.inside{numInside} = tempM.input;
        fprintf('The neural network is unsafe with respect to unsafe region.\n');
        break;
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
            fprintf('Safety of the neural network is not clear for the current terminate parameter: %g\nThe safety might be ensured by changing to a smaller parameter.\n',tol);
            break;
        end
    end
end

end

%------------- END OF CODE --------------
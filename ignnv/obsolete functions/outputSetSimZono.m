%replaced by polyCompute method
function [outputIntvl_array,inputIntvl_array] = outputSetSimZono(obj,inputZono,options)
% compute a output set for a single zonotope input interval
%
% Syntax:
% [zono,inputIntvl_array] = outputSetSimZono(obj,inputZono,options)
%
% Inputs:
%    obj - feedforward neural network object
%    inputZono - zonotope object
%    options:
%       numSim - number of random simulations
%       tol - tolerance for partition
%
%
% Outputs:
%    outputIntvl_array - array of output interval matrices
%    inputIntvl_array - array of input interval matrices

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

numSim = options.numSim;
tol =  options.tol;

% generate random output points from a zonotope input set
outputPoint = outputRandom(obj,inputZono,numSim);

% obtain the convex hull of output points as the target set
k = convhulln(outputPoint');
k = unique(k(:));
outputSim_vertices = outputPoint(:,k);
target = Polyhedron('V',outputSim_vertices');

% obtain the interval approximation for input zonotope set for computation
inputIntvl = intervalCompute.zono2interval(inputZono);

% start the algorithm
outputIntvl = outputSetSingle(obj,inputIntvl);
M{1}.input = inputIntvl;
M{1}.output = outputIntvl;
numM = 1;
numIntersect = 0;
numInside = 0;

while numM > 0
    tempM = M{1}; %select the first set in M
    M(1) = []; %remove the selected set
    if intervalCompute.isIntersecting(tempM.input,inputZono) == 0 % the input interval is outside zonotope input
        numM = numM-1;
        continue;
    else % the input interval intersect/inside the zonotope input
        intersectValue = intervalCompute.isIntersecting(tempM.output,target,outputSim_vertices);
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
end

outputIntvl_array.overApprox = [outputIntvl_array.inside,outputIntvl_array.intersect];
inputIntvl_array.overApprox = [inputIntvl_array.inside,inputIntvl_array.intersect];

end

%------------- END OF CODE --------------
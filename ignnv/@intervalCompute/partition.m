function I_array = partition(I,tol)
% partition an interval
%
% Syntax:
%    I_array = partition(I,tol)
%
% Inputs:
%    I - interval matrix
%    tol - tolerance for terminating partitioning
%
% Outputs:
%    I_array - an array of interval matrices after partitioning

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
M{1} = I;
numM = 1;
numI_array = 0;
while numM > 0
    tempM = M{1};
    M(1) = [];
    if intervalCompute.terminate(tempM,tol) == 0
        [I1,I2] = intervalCompute.bisect(tempM);
        M{numM} = I1;
        numM = numM+1;
        M{numM} = I2;
    elseif intervalCompute.terminate(tempM,tol) == 1
        numI_array = numI_array+1;
        I_array{numI_array} = tempM;
        numM = numM-1;
    end
end
end


%------------- END OF CODE --------------
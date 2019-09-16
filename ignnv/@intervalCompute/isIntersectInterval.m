
function res = isIntersectInterval(I,target_I)
% check an interval matrix inside interval matrix
%
% Syntax:
%    res = isIntersectInterval(I,targetSet)
%
% Inputs:
%    I - interval matrix
%    target_I - interval matrix
%
% Outputs:
%    res - indicate the interval is inside/outside/intersect
%    res = 0: I outside I_target
%    res = 1: I inside I_target
%    res = 2: I intersects I_target

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

[dim,~] = size(I);
    for j = 1:1:dim
        if I(j,2) < target_I(j,1) || I(j,1) > target_I(j,2)
            res = 0;
            break;
        else
            res = 2;
        end
    end
    
    if res == 2
        for j = 1:1:dim
            if I(j,1) >= target_I(j,1) && I(j,1) <= target_I(j,2) && I(j,2) ...
                    >= target_I(j,1) && I(j,2) <= target_I(j,2)
                z = 1;
            else
                z = 0;
                break;
            end
        end
        if z == 1
            res = 1;
        else
            res = 2;
        end
    end
end

%------------- END OF CODE --------------
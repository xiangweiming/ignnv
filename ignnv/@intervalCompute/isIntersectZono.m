
function res = isIntersectZono(I,Z)
% check an interval matrix inside a zonotope object
%
% Syntax:
%    res = isInZono(I,Z)
%
% Inputs:
%    I - interval matrix
%    Z - zonotope object
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
I_zono = intervalCompute.interval2zono(I);
if isIntersecting(I,Z)
    res = 2; % two sets intersect
    if in(I_zono,Z)
        res = 1; % I_zono inside targetSet
    end
else
    res = 0; % I_zono outside targetSet
end

end


%------------- END OF CODE --------------
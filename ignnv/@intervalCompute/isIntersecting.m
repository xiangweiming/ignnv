function res = isIntersecting(I,targetSet,varargin)
% check the intersecting relationship of an interval and a target set
%
% Syntax:
%    res = isIntersecting(I,targetSet,targetSet_V)
%
% Inputs:
%    I - interval matrix
%    I_target - targeted interval matrix or mptpolytope object
%    targetSet_V - verices for polytope (recommended for polytope target set)
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

if isa(targetSet, 'zonotope')
    res = intervalCompute.isIntersectZono(I,targetSet);
elseif isa(targetSet, 'Polyhedron')
    res = intervalCompute.isIntersectPoly(I,targetSet,varargin{1});
else
    res = intervalCompute.isIntersectInterval(I,targetSet);
end

end

%------------- END OF CODE --------------
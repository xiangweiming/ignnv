% replac P1 & P2 by using intersectionHull('vert',P1,'vert',P2)
function res = isIntersectPoly(I,P,varargin)
% check an interval matrix inside a zonotope object
%
% Syntax:
%    res = isIntersectPoly(I,P)
%
% Inputs:
%    I - interval matrix
%    P - Polyhedron object in MPT3
%    P_vertices - vertices of P (recommended)
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

I_poly  = intervalCompute.interval2poly(I);
if isEmptySet(I_poly & P)
    res = 0; % I_poly outside targetSet
else
    res = 2; %two sets intersect
    if nargin > 2
        P_V = varargin{1}'; % avoid repeat computing vertices of P;
    else
        P_V = P.V; % compute vertices of P
    end
    I_vertices = combvec(I(1,:),I(2,:));
    res_in = inhull(I_vertices',P_V);
    if prod(res_in) == 1
        res = 1; %I_poly inside targetSet
    end
end


end


%------------- END OF CODE --------------
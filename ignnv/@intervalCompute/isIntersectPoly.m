function res = isIntersectPoly(I,P,varargin)
% check an interval matrix inside a zonotope object
%
% Syntax:
%    res = isIntersectPoly(I,P,tess_P)
%
% Inputs:
%    I - interval matrix
%    P - vertices of P
%    tess_P -  tessellation of P (recommended)
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

V = intervalCompute.vertices(I);


if nargin < 3
    in = polyCompute.inHull(V,P);
    intersect = polyCompute.intersectionHull('vert',V','vert',P');
else
    in = polyCompute.inHull(V,P,varargin{1});
    intersect = polyCompute.intersectionHull('vert',V','vert',P',varargin{1});
end

if intersect 
    res = 2;
    if in
        res = 1;
    end
else
    res = 0;
end
    
end


%------------- END OF CODE --------------
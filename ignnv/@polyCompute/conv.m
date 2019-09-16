function [V, tess_new, tess_original] = conv(points)
% convex hull of a set of points, returns vertices and tessellations
%
% Syntax:
% [V, tess] = conv(points)
%
% Inputs:
%    points - a set of points
%    
% Outputs:
%    V - vertices
%    tess_orignal - oringinal tessellation
%    tess_new - oringinal tessellation
%    
% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
tess_original = convhulln(points');
k = unique(tess_original(:));
V = points(:,k);
tess_new  = tess_original;
for i = 1:1:length(k)
    p = find(tess_original == k(i));
    tess_new(p) = i;
end

end

%------------- END OF CODE --------------
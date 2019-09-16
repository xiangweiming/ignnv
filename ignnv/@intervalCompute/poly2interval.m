function I = poly2interval(P)
% convert a polytope in MPT3 to an interval matrix
%
% Syntax:
% I = poly2interval(P)
%
% Inputs:
%    P - polytope object
%    
% Outputs:
%    P - interval matrix
%    
%

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
Z = conZonotope(P);
I = intervalCompute.zono2interval(Z);

end

%------------- END OF CODE --------------
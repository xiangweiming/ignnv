function P = interval2poly(I)
% convert an interval matrix to a polytope object in MPT3
%
% Syntax:
% P = interval2poly(I)
%
% Inputs:
%    I - interval matrix
%    
% Outputs:
%    P - polytope object
%    
%

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
I_vertices = combvec(I(1,:),I(2,:));
P = Polyhedron('V',I_vertices');

end

%------------- END OF CODE --------------
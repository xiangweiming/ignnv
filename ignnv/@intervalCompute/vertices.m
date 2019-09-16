function V = vertices(I)
% compute the vertices of an interval matrix
%
% Syntax:
% v = vertices(I)
%
% Inputs:
%    I - interval matrix
%    
% Outputs:
%    v - vertices
%    
% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
V = combvec(I(1,:),I(2,:));

end

%------------- END OF CODE --------------
function Z = interval2zono(I)
% convert an interval matrix to a zonotope object in CORA
%
% Syntax:
% Z = interval2zono(I)
%
% Inputs:
%    I - interval matrix
%    
% Outputs:
%    Z - zonotope object
%    
%

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

c = I(:,1) + (I(:,2) - I(:,1))/2;

%generator
dim = length(c);
g = zeros(dim);
for n = 1:dim
    g(n,n) = I(n,2) - c(n);
end
zonoMatrix = [c,g];

%zonotope
Z = zonotope(zonoMatrix);

end

%------------- END OF CODE --------------
function y = randomPoint(Z,num)
% generate random points for an interval
%
% Syntax:
% y = randomPoint(Z,num)
%
% Inputs:
%    Z - zonotope object
%    num - number of random points
%
% Outputs:
%    y - generated points
%
%

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
y = zeros(Z.dim,num);

for i = 1:1:num
    y(:,i) = randPoint(Z);
end

end

%------------- END OF CODE --------------
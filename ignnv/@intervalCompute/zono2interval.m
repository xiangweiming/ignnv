function I = zono2interval(Z)
% convert a zonotope in CORA to an interval matrix
%
% Syntax:
% I = zono2interval(Z)
%
% Inputs:
%    Z - zonotope object

% Outputs:
%    I - interval matrix
%

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

%extract center
c = Z.Z(:,1);

%determine left and right limit
%specially designed for high performance
delta = sum(abs(Z.Z),2) - abs(c);
I(:,1) = c - delta;
I(:,2) = c + delta;

end

%------------- END OF CODE --------------
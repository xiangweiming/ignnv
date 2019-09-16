function I = boundPoint(x)
% compute an interval to include all points
%
% Syntax:
%    I = boundPoint(x)
%
% Inputs:
%    x - input points
%
% Outputs:
%    I - interval matrix

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
[dim,~] = size(x);
I = zeros(dim,2);
for i = 1:1:dim
    I(i,1) = min(x(i,:));
    I(i,2) = max(x(i,:));
end
end


%------------- END OF CODE --------------
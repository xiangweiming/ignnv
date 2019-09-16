function y = randomPoint(I,num)
% generate random points for an interval
%
% Syntax:
% y = randomPoint(I,num)
%
% Inputs:
%    I - interval matrix
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

[dim,~] = size(I);
y = zeros(dim,num);
for i = 1:1:num
    for n = 1:1:dim
        y(n,i) = I(n,1) + (I(n,2) - I(n,1))*rand;
    end
end

end

%------------- END OF CODE --------------
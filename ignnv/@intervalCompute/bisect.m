function [I1,I2] = bisect(I)
% bisection for an interval at its longest axis
%
% Syntax:
%    [I1,I2] = bisect(I)
%
% Inputs:
%    I - interval matrix

% Outputs:
%    [I1,I2] - interval matrices after bisection

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
[value,position] = max(abs(I(:,1)-I(:,2)));
I1 = I;
I1(position,1) = I(position,1)+value/2;
I2 = I;
I2(position,2) = I(position,2)-value/2;
end


%------------- END OF CODE --------------
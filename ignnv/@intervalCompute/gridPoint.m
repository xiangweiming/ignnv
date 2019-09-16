function  y = gridPoint(I,segments)
% generate gridding points for an interval
%
% Syntax:
% y = gridPoint(I,segment)
%
% Inputs:
%    I - interval matrix
%    segments - number of gridding for each dimension
%
% Outputs:
%    y - generated points
%
%

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
lb = I(:,1);
ub = I(:,2);
inputIntvl = interval(lb,ub);
y = gridPoints(inputIntvl, segments); 

end

%------------- END OF CODE --------------
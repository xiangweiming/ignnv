function res = terminate(I,tol)
% check termination condition for an interval
%
% Syntax:
%    res = terminate(I,tol)
%
% Inputs:
%    I - interval matrix
%    tol - tolerance for terminating partitioning
%
% Outputs:
%    res - indicate the interval is small enough for temination,
%    res = 1: termination
%    res = 0: not

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
temp = abs(I(:,1)-I(:,2));
if max(temp) <= tol
    res = 1;
else
    res = 0;
end
end


%------------- END OF CODE --------------
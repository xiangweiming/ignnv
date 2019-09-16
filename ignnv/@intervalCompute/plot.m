function plot(varargin)
% plot an array of 2d intervals
%
% Syntax:
%    plot(I,fillType,color)
%
% Inputs:
%    I - an array of interval matrices
%    fillType - empty or filled
%    color - filled coler
%
% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
if iscell(varargin{1}) == 0
    intervalCompute.plot_single(varargin{1},varargin{2:end});
else
    for i = 1:1:length(varargin{1})
        intervalCompute.plot_single(varargin{1}{i},varargin{2:end});
        hold on;
    end
end
end


%------------- END OF CODE --------------
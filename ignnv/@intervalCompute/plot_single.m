function plot_single(varargin)
% plot a signle 2d interval
%
% Syntax:
%    plot_single(I,fillType,color)
%
% Inputs:
%    I - interval matrix
%    fillType - empty or filled
%    color - filled coler
%
% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

x1 = varargin{1}(1,1);
x2 = varargin{1}(1,2);
y1 = varargin{1}(2,1);
y2 = varargin{1}(2,2);
x = [x1, x2, x2, x1, x1];
y = [y1, y1, y2, y2, y1];
switch nargin
    case 1
        plot(x, y, 'b-', 'LineWidth', 1);
        hold on;
    case 2
        if strcmp(varargin{2}, 'empty')
            plot(x, y, 'b-', 'LineWidth', 1);
            hold on;
        elseif strcmp(varargin{2}, 'full')
            fill(x,y,'b','edgecolor','black');
            hold on
        end
    case 3
        if strcmp(varargin{2}, 'empty')
            plot(x, y, 'Color', varargin{3}, 'LineWidth', 1);
            hold on;
        elseif strcmp(varargin{2}, 'full')
            fill(x,y,varargin{3},'edgecolor','black');
            hold on
        end
end
end


%------------- END OF CODE --------------
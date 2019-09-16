function plotPipe(varargin)
% plot flowpipe with respect to time
%
% Syntax:
%    plotPipe(time,I,I_position,fillcolor,edgecolor)
%
% Inputs:
%    time - time sample
%    I_array - array of intervals for all time sample
%    I_position - the dimension to plot
%    fillcolor - color of the area
%    edgecolor - color of edge
%
% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

l_time = length(varargin{1});
l_I_array = length(varargin{2});
if l_time ~= l_I_array
    error('The dimension of time samples and interval array do not match.')
end

for i = 1:1:l_I_array
    I_min(i) = varargin{2}{i}(varargin{3},1);
    I_max(i) = varargin{2}{i}(varargin{3},2);
end

switch nargin
    case 3
        fill([varargin{1} fliplr(varargin{1})],[I_min fliplr(I_max)],'b','edgecolor','b');
    case 4
        fill([varargin{1} fliplr(varargin{1})],[I_min fliplr(I_max)],varargin{4},'edgecolor','b');
    case 5
        fill([varargin{1} fliplr(varargin{1})],[I_min fliplr(I_max)],varargin{4},'edgecolor',varargin{5});
end
end


%------------- END OF CODE --------------
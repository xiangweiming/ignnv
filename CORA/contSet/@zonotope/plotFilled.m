function h=plotFilled(varargin)
% plotFilled - Plots 2-dimensional projection of a zonotope which is
% colored inside
%
% Syntax:  
%    h = plotFilled(Z) plots the zonotope Z for the first two dimensions
%    h = plotFilled(Z,dims) plots the zonotope Z for the two dimensions i,j: "dims=[i,j]" and returns handle to line-plot object
%    h = plotFilled(Z,dims,'Color','red',...) adds the standard plotting preferences
%
% Inputs:
%    Z - zonotope object
%    dims - dimensions that should be projected (optional) 
%
% Outputs:
%    handle
%
% Example: 
%    Z=zonotope([1 1 0; 0 0 1]);
%    plotFilled(Z)
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: polygon

% Author:       Matthias Althoff
% Written:      27-July-2016
% Last update:  ---
% Last revision:---

%------------- BEGIN CODE --------------

%If only one argument is passed
if nargin==1
    Z=varargin{1};
    dims=[1,2];
    type{1}='b';
    
%If two arguments are passed    
elseif nargin==2
    Z=varargin{1};
    dims=varargin{2};
    type{1}='b';
   
%If three or more arguments are passed
elseif nargin>=3
    Z=varargin{1};
    dims=varargin{2};   
    type(1:length(varargin)-2)=varargin(3:end);
end

% project zonotope
Z = project(Z,dims);

% convert to polygon
p = polygon(Z);

%plot and output the handle
h = fill(p(1,:),p(2,:),type{:});

%------------- END OF CODE --------------
function outputIntvl_array = outputSetNARMA(varargin)
    % computer an output set of an NARMA model for a single input interval
    %
    % Syntax:
    % outputIntvl_array = outputSetNARMA(obj,initialIntvl,inputIntvl,step,options)
    %
    % Inputs:
    %    obj - feedforward neural network object for NARMA model
    %    initialIntvl - initial state set (interval matrix)
    %    inputIntvl - input set (interval matrix)
    %    options (optional):
    %       tol - tolerance for partition
    %       numSim - number of random simulation points
    %       segment - number of grid points    
    %       approach:
    %           uniform - UNIFORM PARTION method
    %           sim - SIMULATION-GUIDED method
    %       simPoint:
    %           random - random simulation
    %           grid - grid points
    
    %
    % Outputs:
    %    outputIntvl_array - array of output interval matrices
    
    % Author:       Weiming Xiang
    % Written:      09/13/2019
    % Last update:  09/13/2019
    
%------------- BEGIN CODE --------------
% ffnn = varargin{1};
% initialIntvl = varargin{2};
% inputIntvl = varargin{3};
% step = varargin{4};
% - default value
% options.tol = 0.1;
% options.numSim = 1e3;
% options.segments= [10; 10];
% options.approach = 'uniform';
% options.simPoint = 'random';

switch nargin
    case 4 % default method and tol, use uniform method with tol = 0.1
        tol = 0.1;
        outputIntvl_array = outputSetNARMAUniform(varargin{1},varargin{2},varargin{3},varargin{4},tol);
    case 5
        if isfield(varargin{5},'tol')
            options.tol = varargin{5}.tol;
        else
            options.tol = 0.1;
        end
        if isfield(varargin{5},'numSim')
            options.numSim = varargin{5}.numSim;
        else
            options.numSim = 1e3;
        end
        if isfield(varargin{5},'segments')
            options.segments = varargin{5}.segments;
        else
            x = [varargin{2}; varargin{3}];
            [dim,~] = size(x);
            options.segments = 10*ones(dim,1);
        end
        if isfield(varargin{5},'approach')
            options.approach = varargin{5}.approach;
        else
            options.approach = 'uniform';
        end
        if isfield(varargin{5},'simPoint')
            options.simPoint = varargin{5}.simPoint;
        else
            options.simPoint = 'random';
        end
        if strcmp(options.approach,'uniform')
            outputIntvl_array = outputSetNARMAUniform(varargin{1},varargin{2},varargin{3},varargin{4},options.tol);
        elseif strcmp(options.approach,'sim')
            outputIntvl_array = outputSetNARMASim(varargin{1},varargin{2},varargin{3},varargin{4},options);
        end
end
        


end

%------------- END OF CODE --------------
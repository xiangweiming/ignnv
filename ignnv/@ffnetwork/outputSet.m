function [outputIntvl_array,inputIntvl_array] = outputSet(varargin)
% compute the input set for the target interval set using BACKWARD COMPUTATION method
%
% Syntax:
% [outputIntvl_array,inputIntvl_array] = outputSet(obj,inputSet,specIntvl,options)
%
% Inputs:
%    obj - feedforward neural network object
%    inputIntvl - interval matrix or zonotope
%    specIntvl (optional) - unsafe interval or targeted output interval matrix
%    options (optional):
%       tol - tolerance for partition
%       numSim - number of random simulation points
%       segment - number of grid points
%       approach:
%           uniform - UNIFORM PARTION method
%           spec - SPECIFICATION-GUIDED method
%           sim - SIMULATION-GUIDED method
%           sim_zono - SIMULATION-GUIDED method for zonotope input
%           back - BACKWARD COMPUTATION method
%       simPoint:
%           random - random simulation
%           grid - grid points
%
%
% Outputs:
%    outputIntvl_array - array of output interval matrices
%    inputIntvl_array - array of input interval matrices

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

% ffnn = varargin{1};
% inputIntvl = varargin{2};
% - default value
% options.tol = 0.1;
% options.numSim = 1e5;
% options.segments= [10; 10];
% options.approach = 'uniform';
% options.simPoint = 'random';

switch nargin
    case 2
        options.tol = 0.1;
        [outputIntvl_array,inputIntvl_array] = outputSetUniform(varargin{1},varargin{2},options.tol); % uniform partition method
    case 3
        if isfield(varargin{3},'tol')
            options.tol = varargin{3}.tol;
        else
            options.tol = 0.1;
        end
        if isfield(varargin{3},'numSim')
            options.numSim = varargin{3}.numSim;
        else
            options.numSim = 1e5;
        end
        if isfield(varargin{3},'segments')
            options.segments = varargin{3}.segments;
        else
            [dim,~] = size(varargin{2});
            options.segments = 10*ones(dim,1);
        end
        if isfield(varargin{3},'approach')
            options.approach = varargin{3}.approach;
        else
            options.approach = 'uniform';
        end
        if isfield(varargin{3},'simPoint')
            options.simPoint = varargin{3}.simPoint;
        else
            options.simPoint = 'random';
        end
        
        if strcmp(options.approach,'uniform')
            [outputIntvl_array,inputIntvl_array] = outputSetUniform(varargin{1},varargin{2},options.tol);
        elseif strcmp(options.approach,'sim')
            [outputIntvl_array,inputIntvl_array] = outputSetSim(varargin{1},varargin{2},options);
        elseif strcmp(options.approach,'sim_zono')
            [outputIntvl_array,inputIntvl_array] = outputSetSimZono(varargin{1},varargin{2},options);
        end
    case 4
        if isfield(varargin{4},'tol')
            options.tol = varargin{4}.tol;
        else
            options.tol = 0.1;
        end
        if isfield(varargin{4},'numSim')
            options.numSim = varargin{4}.numSim;
        else
            numSim = 1e5;
        end
        if isfield(varargin{4},'segments')
            options.segments = varargin{4}.segments;
        else
            options.segments = [10;10];
        end
        if isfield(varargin{4},'approach')
            options.approach = varargin{4}.approach;
        else
            options.approach = 'uniform';
        end
        if isfield(varargin{4},'simPoint')
            options.simPoint = varargin{4}.simPoint;
        else
            options.simPoint = 'random';
        end
        
        if strcmp(options.approach,'spec')
            %unsafeIntvl = varargin{3};
            [outputIntvl_array,inputIntvl_array] = outputSetSpec(varargin{1},varargin{2},varargin{3},options.tol);
        elseif strcmp(options.approach,'back')
            %targetIntvl = varargin{3};
            [outputIntvl_array,inputIntvl_array] = outputSetBack(varargin{1},varargin{2},varargin{3},options.tol);
        elseif strcmp(options.approach,'uniform')
            [outputIntvl_array,inputIntvl_array] = outputSetUniform(varargin{1},varargin{2},options.tol);
        elseif strcmp(varargin{3}.approach,'sim')
            [outputIntvl_array,inputIntvl_array] = outputSetSim(varargin{1},varargin{2},options);
        elseif strcmp(options.approach,'sim_zono')
            [outputIntvl_array,inputIntvl_array] = outputSetSimZono(varargin{1},varargin{2},options);
        end
end

end

%------------- END OF CODE --------------
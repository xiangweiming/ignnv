classdef ffnetwork
    % feedforward class
    %
    % Syntax:
    %    object constructor: Obj = ffnetwork(w,b,a)
    %    copy constructor: Obj = otherObj
    %
    % Inputs:
    %    input1 - weight, cell{matrix}
    %    input2 - bias, cell{vector}
    %    input3 - activation function, cell{string}
    %
    % Outputs:
    %    Obj - Generated Object
    %
    
    % Author:       Weiming Xiang
    % Written:      02/25/2019
    % Last update:  09/13/2019
    
%------------- BEGIN CODE --------------
    
    properties
        weight = {};
        bias = {};
        activeFcn = {};
    end
    
    methods
        %% class constructor
        function obj = ffnetwork(weight,bias,activeFcn)
            obj.weight = weight;
            obj.bias = bias;
            obj.activeFcn = activeFcn;
        end
        
        %% methods in seperate files
        
        % generate an output y for an input x
        y = outputSingle(obj,x)
        
        % generate outputs for gridding point in an input interval
        y = outputGrid(obj,inputIntvl,segments)

        % generate numInput random outputs for an input interval inputInterval
        y = outputRandom(obj,inputIntvl,numInput)
        
        % pre-generate equations for computing output interval
        generateFcn(obj)
        
        % compute the output set for a single interval input
        outputIntvl = outputSetSingle(obj,inputIntvl)
        
        % compute the output set for an interval using UNIFORM PARTITION method
        [outputIntvl_array,inputIntvl_array] = outputSetUniform(obj,inputIntvl,tol) 
        
        % compute the output set for an interval using SPECIFICATION-GUIDED method method
        [outputIntvl_array,inputIntvl_array] = outputSetSpec(obj,inputIntvl,unsafeIntvl,tol) 
        
        % compute the output set for an interval using SIMULATION-GUIDED method
        [outputIntvl_array,inputIntvl_array] = outputSetSim(obj,inputIntvl,options)
        
        % compute the input set for the target interval set using BACKWARD COMPUTATION method
        [outputIntvl_array,inputIntvl_array] = outputSetBack(obj,inputIntvl,targetIntvl,tol) 
        
        % compute the input set for a feedforward network
        [outputIntvl_array,inputIntvl_array] = outputSet(varargin)

        % compute the output set for NARMA model using UNIFORM PARTITION
        % method
        outputIntvl_array = outputSetNARMAUniform(obj,initialIntvl,inputIntvl,step,tol)
        
        % compute the output set for NARMA model using SIMULATION-GUIDED
        % method
        outputIntvl_array = outputSetNARMASim(obj,initialIntvl,inputIntvl,step,options)
        
        % compute the output set for NARMA model using SIMULATION-GUIDED
        % method
        outputIntvl_array = outputSetNARMA(varargin)
        
    end
end
%------------- END OF CODE --------------
    
    
    
    

classdef zonoCompute
    properties
    end
    
    methods(Static)
        
        % convert a zonotope in CORA to an interval matrix
        I = zono2interval(Z)
        
        % convert an interval matrix to a zonotope in CORA
        Z = interval2zono(I)
        
        % generate random points for a zonotope
        y = randomPoint(Z,num)
        
        % compute an interval to include all points
        I = boundPoint(x,varargin)
        
    end

end
classdef intervalCompute
    properties
    end
    
    methods(Static)
        
        % convert a zonotope in CORA to an interval matrix
        I = zono2interval(Z)
        
        % convert an interval matrix to a zonotope in CORA
        Z = interval2zono(I)
        
        % convert an interval matrix to a polytope in MPT3
        P = interval2poly(I)
        
        % convert a polytope in MPT3 to an interval matrix
        I = poly2interval(P)
        
        % check an interval matrix inside a zonotope object
        res = isIntersectZono(I,Z)
        
        % check an interval matrix inside a polytope object
        res = isIntersectPoly(I,P,varargin)
        
        % check an interval matrix inside an interval
        res = isIntersectInterval(I,targetSet)
        
        % generate random points for an interval
        y = randomPoint(I,num)
        
        % generate gridding points for an interval
        y = gridPoint(I,segment)
        
        % besection for an interval
        [I1,I2] = bisect(I)
        
        % partition an interval
        I_array = partition(I,tol)
        
        % check termination condition for an interval
        res = terminate(I,tol)
        
        % compute an interval to include all points
        I = boundPoint(x)
        
        % compute an interval to include all intervals
        I = boundInterval(I_array)
        
        % check the intersecting relationship of two sets
        % res = isIntersecting(I,targetSet,varargin)
        
        % compute the vertices of an interval matrix
        V = vertices(I)
        
        % plot a single 2d interval
        plot_single(varargin)
        
        % plot an array of 2d intervals
        plot(varargin)
        
        % plot flowpipe
        plotPipe(varargin)
        
    end
    
end
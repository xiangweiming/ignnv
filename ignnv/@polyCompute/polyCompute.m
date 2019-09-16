classdef polyCompute
    % All computation ara based on vertices and its tessellation (optional)
    properties
    end
    
    methods(Static)
        
        % convex hull of a set of points, returns vertices and tessellations
        [V, tess_new, tess_original] = conv(points)
        
        % check if polytope P1 is in polytope P2
        res = inHull(P1,P2,tess_P2,tol)
        
        % functions vert2lcon, lcon2vert, intersectionHull are for
        % intersection
        % convert verrtices to linear constraint
        [A,b,Aeq,beq]=vert2lcon(V,varargin)
        
        % convert linear constraint repre-sentation to vertice representation
        [V,nr,nre]=lcon2vert(A,b,Aeq,beq,TOL,checkbounds)
        
        % check if two polytopes intersect
        res = intersectionHull(varargin)
        
        % check the intersecting relationship of an interval and a target set
   
    end
    
end
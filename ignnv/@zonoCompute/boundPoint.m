function Z = boundPoint(x,varargin)
% compute an oriented interval (zonotope) to include all points
%
% Syntax:
%    Z = boundPoint(x, tol)
%
% Inputs:
%    x - input points
%    tol (optional) - tolerance error in the solution with respect to the optimal value
%
% Outputs:
%    Z - zonotope object

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
%[A , c] = MinVolEllipse(P, tolerance)

if nargin < 2
    tol = 0.1;
else
    tol = varargin{1};
end


[d,N] = size(x);
Q = zeros(d+1,N);
Q(1:d,:) = x(1:d,1:N);
Q(d+1,:) = ones(1,N);
% initializations
% -----------------------------------
count = 1;
err = 1;
u = (1/N) * ones(N,1);          % 1st iteration
% Khachiyan Algorithm
% -----------------------------------
while err > tol
    X = Q * diag(u) * Q';       % X = \sum_i ( u_i * q_i * q_i')  is a (d+1)x(d+1) matrix
    M = diag(Q' * inv(X) * Q);  % M the diagonal vector of an NxN matrix
    [maximum, j] = max(M);
    step_size = (maximum - d -1)/((d+1)*(maximum-1));
    new_u = (1 - step_size)*u ;
    new_u(j) = new_u(j) + step_size;
    count = count + 1;
    err = norm(new_u - u);
    u = new_u;
end
%%%%%%%%%%%%%%%%%%% Computing the Ellipse parameters%%%%%%%%%%%%%%%%%%%%%%
% Finds the ellipse equation in the 'center form': 
% (x-c)' * A * (x-c) = 1
% It computes a dxd matrix 'A' and a d dimensional vector 'c' as the center
% of the ellipse. 
U = diag(u);
% the A matrix for the ellipse
% --------------------------------------------
A = (1/d) * inv(x * U * x' - (x * u)*(x*u)' );
% center of the ellipse 
% --------------------------------------------
c = x * u;
% construct zonotope
[v,lambda] = eig(A);
for i = 1:1:length(lambda)
    G(:,i) = lambda(i,i)^(-0.5)*v(:,i);
end

zonoMatrix = [c,G];
Z = zonotope(zonoMatrix);

%------------- END OF CODE --------------
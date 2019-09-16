function Z = boundPointOrient(x, tol)
% compute an oriented interval (zonotope) to include all points
%
% Syntax:
%    Z = boundPoint(x)
%
% Inputs:
%    x - input points
%
% Outputs:
%    Z - zonotope object

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
%% The minimal volume ellipsoid [A , c] = MinVolEllipse(P, tolerance)

if nargin < 2
    tol = 0.1;
end

[d N] = size(x);
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
A = (1/d) / inv(x * U * x' - (x * u)*(x*u)' );
% center of the ellipse 
% --------------------------------------------
c = P * u; 
%%


%------------- END OF CODE --------------
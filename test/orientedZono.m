clc
clear
x = randn(10,2)';

tol = 0.1;
tic
Z = zonoCompute.boundPoint(x,tol);
toc
plot( x(1,:), x(2,:), 'ro');
hold on
plot(Z);

I = intervalCompute.boundPoint(x)
Z_I = zonoCompute.interval2zono(I)
plot(Z_I);

volume_Z = volume(Z)
volume_Z_I = volume(Z_I)



%% cvx
tic
[n,m] = size(x);
cvx_begin quiet
    variable A(n,n) symmetric
    variable b(n)
    maximize( det_rootn( A ) )
    subject to
        norms( A * x + b * ones( 1, m ), 2 ) <= 1;
cvx_end
toc
%%
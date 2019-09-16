clc
clear
dim = 2;
I = randn(dim,100);
[I_vertices,I_tess,~] = polyCompute.conv(I);

Iin = rand(dim,3);
[Iin_vertices,Iin_tess,~] = polyCompute.conv(Iin);

tic
res = polyCompute.inHull(Iin,I)
toc

tic
res_tess = polyCompute.inHull(Iin_vertices,I_vertices,I_tess)
toc


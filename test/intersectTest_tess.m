clc
clear
dim = 2;
I = randn(dim,100);
[I_vertices,I_tess,~] = polyCompute.conv(I);

Iinter = rand(dim,100) + 0.5;
[Iinter_vertices,Iinter_tess,~] = polyCompute.conv(Iinter);

tic
res = polyCompute.intersectionHull('vert',I_vertices','vert',Iinter_vertices')
toc

tic
res_tess = polyCompute.intersectionHull('vert',I_vertices',I_tess,'vert',Iinter_vertices', Iinter_tess)
toc


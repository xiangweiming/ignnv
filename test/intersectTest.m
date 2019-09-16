clc
clear

I = [0 1; 0 1];
Iout = [2 3; 2 3];
Iin = [-1 1;-1 1];
Iinter = [0.5 2;0.5 2];

Z = intervalCompute.interval2zono(I);
Zout = intervalCompute.interval2zono(Iout);
Zin = intervalCompute.interval2zono(Iin);
Zinter = intervalCompute.interval2zono(Iinter);

% figure;
% hold on
% plot(Z);
% plot(Zout);
% plot(Zin);
% plot(Zinter);

res = intervalCompute.isIntersectZono(I,Zout)
res = intervalCompute.isIntersectZono(I,Zin)
res = intervalCompute.isIntersectZono(I,Zinter)

P = intervalCompute.interval2poly(I);
Pout = intervalCompute.interval2poly(Iout);
Pin = intervalCompute.interval2poly(Iin);
Pinter = intervalCompute.interval2poly(Iinter);
res = intervalCompute.isIntersectPoly(I,Pout)
res = intervalCompute.isIntersectPoly(I,Pin)
res = intervalCompute.isIntersectPoly(I,Pinter)

Iout_vertices = combvec(Iout(1,:),Iout(2,:));
Iin_vertices = combvec(Iin(1,:),Iin(2,:));
Iinter_vertices = combvec(Iinter(1,:),Iin(2,:));
res = intervalCompute.isIntersecting(I,Iout,Iout_vertices)
res = intervalCompute.isIntersecting(I,Iin,Iin_vertices)
res = intervalCompute.isIntersecting(I,Iinter,Iinter_vertices)

I_vertices = combvec(I(1,:),I(2,:))';
Iout_vertices = Iout_vertices';
Iin_vertices = Iin_vertices';
Iinter_vertices = Iinter_vertices';

dim = 2;
I = randn(100,dim);
[I_vertices,I_tess,~] = polyCompute.conv(I)

Iinter = rand(100,dim) + 0.5;
[Iinter_vertices,Iinter_tess,~] = polyCompute.conv(Iinter);

tic
res = intersectionHull('vert',I_vertices','vert',Iinter_vertices')
toc

tic
res_tess = intersectionHull('vert',I_vertices',I_tess,'vert',Iinter_vertices', Iinter_tess)
toc

for i = 1:1:length(k)
    p = find(k_tess == k(i));
    k_tess_vertices(p) = i;
end
k_tess_vertices
convhulln(Iinter_vertices)


tic
Interset = intersectionHull('vert',I_vertices,'vert',Iinter_vertices);
Interset_vertices = Interset.vert;
toc
%Interset_poly = Polyhedron('V',Interset_vertices');

tic
P = Polyhedron('V',I_vertices);
Pinter = Polyhedron('V',Iinter_vertices);
intersect(P,Pinter)
toc



% figure; hold on
% plot(P);
% plot(Pout);
% plot(Pin);
% plot(Pinter);


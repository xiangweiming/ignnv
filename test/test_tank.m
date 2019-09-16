clc
clear
dim = 6;
C = eye(dim);
Plant = NonLinearODE(dim, 1, @tank6Eq);
Plant.set_zonotopeOrder(50);

x0 = [2; 4; 4; 2; 10; 4];
init_set = zonotope([x0,0.2*eye(dim)]);
input_set = zonotope([0,0.005]);
timeStep = 1;
tFinal = 400;

[t, y] = evaluate(Plant,[0,tFinal], x0, 0);

[R, final_R_interval] = reach_zono(Plant, init_set, input_set, timeStep, tFinal);

for plotRun=1:3
    % plot different projections
    if plotRun==1
        projectedDimensions=[1 2];
    elseif plotRun==2
        projectedDimensions=[3 4];    
    elseif plotRun==3
        projectedDimensions=[5 6]; 
    end 
    
    figure;
    hold on
    
    %plot reachable sets
    for i=1:length(R)
        for j=1:length(R{i})
            Zproj = project(R{i}{j},projectedDimensions);
            Zproj = reduce(Zproj,'girard',3);
            plotFilled(Zproj,[1 2],[.8 .8 .8],'EdgeColor','none');
        end
    end
    
    
    %plot initial set
    plotFilled(init_set,projectedDimensions,'w','EdgeColor','k');
    
end

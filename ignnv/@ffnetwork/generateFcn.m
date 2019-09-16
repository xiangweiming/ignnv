function generateFcn(obj)
% pre-generate equations for computing output interval
%
% Syntax:
% generateFcn(obj)
%
% Inputs:
%    obj - feedforward object
%  
%

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------

fileName = ('layerOutputSet.m');
fid = fopen(fileName,'w');
numLayer = length(obj.bias);
fprintf(fid,'function y = layerOutputSet(ffnetwork,inputIntvl,numLayer)\n');
fprintf(fid,'switch numLayer\n');
for k = 1:1:numLayer
    fprintf(fid,'case %i\n',k);
    [n,m] = size(obj.weight{k});
    for i = 1:1:n
        fprintf(fid,'xmax(%i) = ',i);
        for j = 1:1:m-1
            if obj.weight{k}(i,j) > 0
                fprintf(fid,'ffnetwork.weight{%i}(%i,%i)*inputIntvl(%i,2)+',k,i,j,j);
            else
                fprintf(fid,'ffnetwork.weight{%i}(%i,%i)*inputIntvl(%i,1)+',k,i,j,j);
            end
        end
        if obj.weight{k}(i,m) > 0
            fprintf(fid,'ffnetwork.weight{%i}(%i,%i)*inputIntvl(%i,2)+ffnetwork.bias{%i}(%i);\n',k,i,m,m,k,i);
        else
            fprintf(fid,'ffnetwork.weight{%i}(%i,%i)*inputIntvl(%i,1)+ffnetwork.bias{%i}(%i);\n',k,i,m,m,k,i);
        end
        fprintf(fid,'xmin(%i) = ',i);
        for j = 1:1:m-1
            if obj.weight{k}(i,j) > 0
                fprintf(fid,'ffnetwork.weight{%i}(%i,%i)*inputIntvl(%i,1)+',k,i,j,j);
            else
                fprintf(fid,'ffnetwork.weight{%i}(%i,%i)*inputIntvl(%i,2)+',k,i,j,j);
            end
        end
        if obj.weight{k}(i,m) > 0
            fprintf(fid,'ffnetwork.weight{%i}(%i,%i)*inputIntvl(%i,1)+ffnetwork.bias{%i}(%i);\n',k,i,m,m,k,i);
        else
            fprintf(fid,'ffnetwork.weight{%i}(%i,%i)*inputIntvl(%i,2)+ffnetwork.bias{%i}(%i);\n',k,i,m,m,k,i);
        end
    end
    fprintf(fid,'y(:,1) = activation(xmin,ffnetwork.activeFcn{%i});\n',k);
    fprintf(fid,'y(:,2) = activation(xmax,ffnetwork.activeFcn{%i});\n',k);
end
fprintf(fid,'end\n');
fclose(fid);
end


%------------- END OF CODE --------------
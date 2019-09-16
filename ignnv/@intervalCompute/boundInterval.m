function I = boundInterval(I_array)
% compute an interval to include all intervals
%
% Syntax:
%    I = boundInterval(I_array)
%
% Inputs:
%    I_array - an array of interval matrices
%
% Outputs:
%    I - interval matrix

% Author:       Weiming Xiang
% Written:      02/25/2019
% Last update:  02/25/2019

%------------- BEGIN CODE --------------
[dim,~] = size(I_array{1});
length_I_array = length(I_array);
I = zeros(dim,2);

for i = 1:1:dim
    tempMin = I_array{1}(i,1);
    tempMax = I_array{1}(i,2);
    for j = 2:1:length_I_array
        if tempMin > I_array{j}(i,1)
            tempMin = I_array{j}(i,1);
        end
        if tempMax < I_array{j}(i,2)
            tempMax =  I_array{j}(i,2);
        end
    end
    I(i,:) = [tempMin,tempMax];
end
end


%------------- END OF CODE --------------
function y = layerOutputSet(ffnetwork,inputIntvl,numLayer)
switch numLayer
case 1
xmax(1) = ffnetwork.weight{1}(1,1)*inputIntvl(1,1)+ffnetwork.weight{1}(1,2)*inputIntvl(2,1)+ffnetwork.bias{1}(1);
xmin(1) = ffnetwork.weight{1}(1,1)*inputIntvl(1,2)+ffnetwork.weight{1}(1,2)*inputIntvl(2,2)+ffnetwork.bias{1}(1);
xmax(2) = ffnetwork.weight{1}(2,1)*inputIntvl(1,1)+ffnetwork.weight{1}(2,2)*inputIntvl(2,1)+ffnetwork.bias{1}(2);
xmin(2) = ffnetwork.weight{1}(2,1)*inputIntvl(1,2)+ffnetwork.weight{1}(2,2)*inputIntvl(2,2)+ffnetwork.bias{1}(2);
xmax(3) = ffnetwork.weight{1}(3,1)*inputIntvl(1,1)+ffnetwork.weight{1}(3,2)*inputIntvl(2,1)+ffnetwork.bias{1}(3);
xmin(3) = ffnetwork.weight{1}(3,1)*inputIntvl(1,2)+ffnetwork.weight{1}(3,2)*inputIntvl(2,2)+ffnetwork.bias{1}(3);
xmax(4) = ffnetwork.weight{1}(4,1)*inputIntvl(1,1)+ffnetwork.weight{1}(4,2)*inputIntvl(2,1)+ffnetwork.bias{1}(4);
xmin(4) = ffnetwork.weight{1}(4,1)*inputIntvl(1,2)+ffnetwork.weight{1}(4,2)*inputIntvl(2,2)+ffnetwork.bias{1}(4);
xmax(5) = ffnetwork.weight{1}(5,1)*inputIntvl(1,2)+ffnetwork.weight{1}(5,2)*inputIntvl(2,1)+ffnetwork.bias{1}(5);
xmin(5) = ffnetwork.weight{1}(5,1)*inputIntvl(1,1)+ffnetwork.weight{1}(5,2)*inputIntvl(2,2)+ffnetwork.bias{1}(5);
y(:,1) = activation(xmin,ffnetwork.activeFcn{1});
y(:,2) = activation(xmax,ffnetwork.activeFcn{1});
case 2
xmax(1) = ffnetwork.weight{2}(1,1)*inputIntvl(1,2)+ffnetwork.weight{2}(1,2)*inputIntvl(2,1)+ffnetwork.weight{2}(1,3)*inputIntvl(3,2)+ffnetwork.weight{2}(1,4)*inputIntvl(4,1)+ffnetwork.weight{2}(1,5)*inputIntvl(5,1)+ffnetwork.bias{2}(1);
xmin(1) = ffnetwork.weight{2}(1,1)*inputIntvl(1,1)+ffnetwork.weight{2}(1,2)*inputIntvl(2,2)+ffnetwork.weight{2}(1,3)*inputIntvl(3,1)+ffnetwork.weight{2}(1,4)*inputIntvl(4,2)+ffnetwork.weight{2}(1,5)*inputIntvl(5,2)+ffnetwork.bias{2}(1);
xmax(2) = ffnetwork.weight{2}(2,1)*inputIntvl(1,2)+ffnetwork.weight{2}(2,2)*inputIntvl(2,2)+ffnetwork.weight{2}(2,3)*inputIntvl(3,1)+ffnetwork.weight{2}(2,4)*inputIntvl(4,2)+ffnetwork.weight{2}(2,5)*inputIntvl(5,2)+ffnetwork.bias{2}(2);
xmin(2) = ffnetwork.weight{2}(2,1)*inputIntvl(1,1)+ffnetwork.weight{2}(2,2)*inputIntvl(2,1)+ffnetwork.weight{2}(2,3)*inputIntvl(3,2)+ffnetwork.weight{2}(2,4)*inputIntvl(4,1)+ffnetwork.weight{2}(2,5)*inputIntvl(5,1)+ffnetwork.bias{2}(2);
y(:,1) = activation(xmin,ffnetwork.activeFcn{2});
y(:,2) = activation(xmax,ffnetwork.activeFcn{2});
end

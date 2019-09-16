function y = layerOutputSet(ffnetwork,inputIntvl,numLayer)
switch numLayer
case 1
xmax(1) = ffnetwork.weight{1}(1,1)*inputIntvl(1,2)+ffnetwork.weight{1}(1,2)*inputIntvl(2,2)+ffnetwork.weight{1}(1,3)*inputIntvl(3,2)+ffnetwork.weight{1}(1,4)*inputIntvl(4,1)+ffnetwork.weight{1}(1,5)*inputIntvl(5,2)+ffnetwork.bias{1}(1);
xmin(1) = ffnetwork.weight{1}(1,1)*inputIntvl(1,1)+ffnetwork.weight{1}(1,2)*inputIntvl(2,1)+ffnetwork.weight{1}(1,3)*inputIntvl(3,1)+ffnetwork.weight{1}(1,4)*inputIntvl(4,2)+ffnetwork.weight{1}(1,5)*inputIntvl(5,1)+ffnetwork.bias{1}(1);
xmax(2) = ffnetwork.weight{1}(2,1)*inputIntvl(1,1)+ffnetwork.weight{1}(2,2)*inputIntvl(2,1)+ffnetwork.weight{1}(2,3)*inputIntvl(3,2)+ffnetwork.weight{1}(2,4)*inputIntvl(4,2)+ffnetwork.weight{1}(2,5)*inputIntvl(5,2)+ffnetwork.bias{1}(2);
xmin(2) = ffnetwork.weight{1}(2,1)*inputIntvl(1,2)+ffnetwork.weight{1}(2,2)*inputIntvl(2,2)+ffnetwork.weight{1}(2,3)*inputIntvl(3,1)+ffnetwork.weight{1}(2,4)*inputIntvl(4,1)+ffnetwork.weight{1}(2,5)*inputIntvl(5,1)+ffnetwork.bias{1}(2);
xmax(3) = ffnetwork.weight{1}(3,1)*inputIntvl(1,2)+ffnetwork.weight{1}(3,2)*inputIntvl(2,2)+ffnetwork.weight{1}(3,3)*inputIntvl(3,1)+ffnetwork.weight{1}(3,4)*inputIntvl(4,1)+ffnetwork.weight{1}(3,5)*inputIntvl(5,1)+ffnetwork.bias{1}(3);
xmin(3) = ffnetwork.weight{1}(3,1)*inputIntvl(1,1)+ffnetwork.weight{1}(3,2)*inputIntvl(2,1)+ffnetwork.weight{1}(3,3)*inputIntvl(3,2)+ffnetwork.weight{1}(3,4)*inputIntvl(4,2)+ffnetwork.weight{1}(3,5)*inputIntvl(5,2)+ffnetwork.bias{1}(3);
xmax(4) = ffnetwork.weight{1}(4,1)*inputIntvl(1,2)+ffnetwork.weight{1}(4,2)*inputIntvl(2,2)+ffnetwork.weight{1}(4,3)*inputIntvl(3,1)+ffnetwork.weight{1}(4,4)*inputIntvl(4,1)+ffnetwork.weight{1}(4,5)*inputIntvl(5,2)+ffnetwork.bias{1}(4);
xmin(4) = ffnetwork.weight{1}(4,1)*inputIntvl(1,1)+ffnetwork.weight{1}(4,2)*inputIntvl(2,1)+ffnetwork.weight{1}(4,3)*inputIntvl(3,2)+ffnetwork.weight{1}(4,4)*inputIntvl(4,2)+ffnetwork.weight{1}(4,5)*inputIntvl(5,1)+ffnetwork.bias{1}(4);
xmax(5) = ffnetwork.weight{1}(5,1)*inputIntvl(1,2)+ffnetwork.weight{1}(5,2)*inputIntvl(2,2)+ffnetwork.weight{1}(5,3)*inputIntvl(3,2)+ffnetwork.weight{1}(5,4)*inputIntvl(4,1)+ffnetwork.weight{1}(5,5)*inputIntvl(5,1)+ffnetwork.bias{1}(5);
xmin(5) = ffnetwork.weight{1}(5,1)*inputIntvl(1,1)+ffnetwork.weight{1}(5,2)*inputIntvl(2,1)+ffnetwork.weight{1}(5,3)*inputIntvl(3,1)+ffnetwork.weight{1}(5,4)*inputIntvl(4,2)+ffnetwork.weight{1}(5,5)*inputIntvl(5,2)+ffnetwork.bias{1}(5);
xmax(6) = ffnetwork.weight{1}(6,1)*inputIntvl(1,2)+ffnetwork.weight{1}(6,2)*inputIntvl(2,2)+ffnetwork.weight{1}(6,3)*inputIntvl(3,1)+ffnetwork.weight{1}(6,4)*inputIntvl(4,1)+ffnetwork.weight{1}(6,5)*inputIntvl(5,2)+ffnetwork.bias{1}(6);
xmin(6) = ffnetwork.weight{1}(6,1)*inputIntvl(1,1)+ffnetwork.weight{1}(6,2)*inputIntvl(2,1)+ffnetwork.weight{1}(6,3)*inputIntvl(3,2)+ffnetwork.weight{1}(6,4)*inputIntvl(4,2)+ffnetwork.weight{1}(6,5)*inputIntvl(5,1)+ffnetwork.bias{1}(6);
xmax(7) = ffnetwork.weight{1}(7,1)*inputIntvl(1,1)+ffnetwork.weight{1}(7,2)*inputIntvl(2,1)+ffnetwork.weight{1}(7,3)*inputIntvl(3,1)+ffnetwork.weight{1}(7,4)*inputIntvl(4,2)+ffnetwork.weight{1}(7,5)*inputIntvl(5,2)+ffnetwork.bias{1}(7);
xmin(7) = ffnetwork.weight{1}(7,1)*inputIntvl(1,2)+ffnetwork.weight{1}(7,2)*inputIntvl(2,2)+ffnetwork.weight{1}(7,3)*inputIntvl(3,2)+ffnetwork.weight{1}(7,4)*inputIntvl(4,1)+ffnetwork.weight{1}(7,5)*inputIntvl(5,1)+ffnetwork.bias{1}(7);
xmax(8) = ffnetwork.weight{1}(8,1)*inputIntvl(1,2)+ffnetwork.weight{1}(8,2)*inputIntvl(2,2)+ffnetwork.weight{1}(8,3)*inputIntvl(3,1)+ffnetwork.weight{1}(8,4)*inputIntvl(4,2)+ffnetwork.weight{1}(8,5)*inputIntvl(5,2)+ffnetwork.bias{1}(8);
xmin(8) = ffnetwork.weight{1}(8,1)*inputIntvl(1,1)+ffnetwork.weight{1}(8,2)*inputIntvl(2,1)+ffnetwork.weight{1}(8,3)*inputIntvl(3,2)+ffnetwork.weight{1}(8,4)*inputIntvl(4,1)+ffnetwork.weight{1}(8,5)*inputIntvl(5,1)+ffnetwork.bias{1}(8);
xmax(9) = ffnetwork.weight{1}(9,1)*inputIntvl(1,2)+ffnetwork.weight{1}(9,2)*inputIntvl(2,2)+ffnetwork.weight{1}(9,3)*inputIntvl(3,2)+ffnetwork.weight{1}(9,4)*inputIntvl(4,2)+ffnetwork.weight{1}(9,5)*inputIntvl(5,2)+ffnetwork.bias{1}(9);
xmin(9) = ffnetwork.weight{1}(9,1)*inputIntvl(1,1)+ffnetwork.weight{1}(9,2)*inputIntvl(2,1)+ffnetwork.weight{1}(9,3)*inputIntvl(3,1)+ffnetwork.weight{1}(9,4)*inputIntvl(4,1)+ffnetwork.weight{1}(9,5)*inputIntvl(5,1)+ffnetwork.bias{1}(9);
xmax(10) = ffnetwork.weight{1}(10,1)*inputIntvl(1,1)+ffnetwork.weight{1}(10,2)*inputIntvl(2,1)+ffnetwork.weight{1}(10,3)*inputIntvl(3,1)+ffnetwork.weight{1}(10,4)*inputIntvl(4,2)+ffnetwork.weight{1}(10,5)*inputIntvl(5,2)+ffnetwork.bias{1}(10);
xmin(10) = ffnetwork.weight{1}(10,1)*inputIntvl(1,2)+ffnetwork.weight{1}(10,2)*inputIntvl(2,2)+ffnetwork.weight{1}(10,3)*inputIntvl(3,2)+ffnetwork.weight{1}(10,4)*inputIntvl(4,1)+ffnetwork.weight{1}(10,5)*inputIntvl(5,1)+ffnetwork.bias{1}(10);
xmax(11) = ffnetwork.weight{1}(11,1)*inputIntvl(1,1)+ffnetwork.weight{1}(11,2)*inputIntvl(2,1)+ffnetwork.weight{1}(11,3)*inputIntvl(3,2)+ffnetwork.weight{1}(11,4)*inputIntvl(4,1)+ffnetwork.weight{1}(11,5)*inputIntvl(5,1)+ffnetwork.bias{1}(11);
xmin(11) = ffnetwork.weight{1}(11,1)*inputIntvl(1,2)+ffnetwork.weight{1}(11,2)*inputIntvl(2,2)+ffnetwork.weight{1}(11,3)*inputIntvl(3,1)+ffnetwork.weight{1}(11,4)*inputIntvl(4,2)+ffnetwork.weight{1}(11,5)*inputIntvl(5,2)+ffnetwork.bias{1}(11);
xmax(12) = ffnetwork.weight{1}(12,1)*inputIntvl(1,2)+ffnetwork.weight{1}(12,2)*inputIntvl(2,2)+ffnetwork.weight{1}(12,3)*inputIntvl(3,2)+ffnetwork.weight{1}(12,4)*inputIntvl(4,1)+ffnetwork.weight{1}(12,5)*inputIntvl(5,1)+ffnetwork.bias{1}(12);
xmin(12) = ffnetwork.weight{1}(12,1)*inputIntvl(1,1)+ffnetwork.weight{1}(12,2)*inputIntvl(2,1)+ffnetwork.weight{1}(12,3)*inputIntvl(3,1)+ffnetwork.weight{1}(12,4)*inputIntvl(4,2)+ffnetwork.weight{1}(12,5)*inputIntvl(5,2)+ffnetwork.bias{1}(12);
xmax(13) = ffnetwork.weight{1}(13,1)*inputIntvl(1,2)+ffnetwork.weight{1}(13,2)*inputIntvl(2,2)+ffnetwork.weight{1}(13,3)*inputIntvl(3,1)+ffnetwork.weight{1}(13,4)*inputIntvl(4,1)+ffnetwork.weight{1}(13,5)*inputIntvl(5,2)+ffnetwork.bias{1}(13);
xmin(13) = ffnetwork.weight{1}(13,1)*inputIntvl(1,1)+ffnetwork.weight{1}(13,2)*inputIntvl(2,1)+ffnetwork.weight{1}(13,3)*inputIntvl(3,2)+ffnetwork.weight{1}(13,4)*inputIntvl(4,2)+ffnetwork.weight{1}(13,5)*inputIntvl(5,1)+ffnetwork.bias{1}(13);
xmax(14) = ffnetwork.weight{1}(14,1)*inputIntvl(1,1)+ffnetwork.weight{1}(14,2)*inputIntvl(2,1)+ffnetwork.weight{1}(14,3)*inputIntvl(3,1)+ffnetwork.weight{1}(14,4)*inputIntvl(4,2)+ffnetwork.weight{1}(14,5)*inputIntvl(5,1)+ffnetwork.bias{1}(14);
xmin(14) = ffnetwork.weight{1}(14,1)*inputIntvl(1,2)+ffnetwork.weight{1}(14,2)*inputIntvl(2,2)+ffnetwork.weight{1}(14,3)*inputIntvl(3,2)+ffnetwork.weight{1}(14,4)*inputIntvl(4,1)+ffnetwork.weight{1}(14,5)*inputIntvl(5,2)+ffnetwork.bias{1}(14);
xmax(15) = ffnetwork.weight{1}(15,1)*inputIntvl(1,1)+ffnetwork.weight{1}(15,2)*inputIntvl(2,1)+ffnetwork.weight{1}(15,3)*inputIntvl(3,1)+ffnetwork.weight{1}(15,4)*inputIntvl(4,2)+ffnetwork.weight{1}(15,5)*inputIntvl(5,2)+ffnetwork.bias{1}(15);
xmin(15) = ffnetwork.weight{1}(15,1)*inputIntvl(1,2)+ffnetwork.weight{1}(15,2)*inputIntvl(2,2)+ffnetwork.weight{1}(15,3)*inputIntvl(3,2)+ffnetwork.weight{1}(15,4)*inputIntvl(4,1)+ffnetwork.weight{1}(15,5)*inputIntvl(5,1)+ffnetwork.bias{1}(15);
xmax(16) = ffnetwork.weight{1}(16,1)*inputIntvl(1,2)+ffnetwork.weight{1}(16,2)*inputIntvl(2,2)+ffnetwork.weight{1}(16,3)*inputIntvl(3,2)+ffnetwork.weight{1}(16,4)*inputIntvl(4,2)+ffnetwork.weight{1}(16,5)*inputIntvl(5,1)+ffnetwork.bias{1}(16);
xmin(16) = ffnetwork.weight{1}(16,1)*inputIntvl(1,1)+ffnetwork.weight{1}(16,2)*inputIntvl(2,1)+ffnetwork.weight{1}(16,3)*inputIntvl(3,1)+ffnetwork.weight{1}(16,4)*inputIntvl(4,1)+ffnetwork.weight{1}(16,5)*inputIntvl(5,2)+ffnetwork.bias{1}(16);
xmax(17) = ffnetwork.weight{1}(17,1)*inputIntvl(1,1)+ffnetwork.weight{1}(17,2)*inputIntvl(2,1)+ffnetwork.weight{1}(17,3)*inputIntvl(3,1)+ffnetwork.weight{1}(17,4)*inputIntvl(4,2)+ffnetwork.weight{1}(17,5)*inputIntvl(5,1)+ffnetwork.bias{1}(17);
xmin(17) = ffnetwork.weight{1}(17,1)*inputIntvl(1,2)+ffnetwork.weight{1}(17,2)*inputIntvl(2,2)+ffnetwork.weight{1}(17,3)*inputIntvl(3,2)+ffnetwork.weight{1}(17,4)*inputIntvl(4,1)+ffnetwork.weight{1}(17,5)*inputIntvl(5,2)+ffnetwork.bias{1}(17);
xmax(18) = ffnetwork.weight{1}(18,1)*inputIntvl(1,2)+ffnetwork.weight{1}(18,2)*inputIntvl(2,2)+ffnetwork.weight{1}(18,3)*inputIntvl(3,2)+ffnetwork.weight{1}(18,4)*inputIntvl(4,1)+ffnetwork.weight{1}(18,5)*inputIntvl(5,1)+ffnetwork.bias{1}(18);
xmin(18) = ffnetwork.weight{1}(18,1)*inputIntvl(1,1)+ffnetwork.weight{1}(18,2)*inputIntvl(2,1)+ffnetwork.weight{1}(18,3)*inputIntvl(3,1)+ffnetwork.weight{1}(18,4)*inputIntvl(4,2)+ffnetwork.weight{1}(18,5)*inputIntvl(5,2)+ffnetwork.bias{1}(18);
xmax(19) = ffnetwork.weight{1}(19,1)*inputIntvl(1,2)+ffnetwork.weight{1}(19,2)*inputIntvl(2,2)+ffnetwork.weight{1}(19,3)*inputIntvl(3,1)+ffnetwork.weight{1}(19,4)*inputIntvl(4,1)+ffnetwork.weight{1}(19,5)*inputIntvl(5,1)+ffnetwork.bias{1}(19);
xmin(19) = ffnetwork.weight{1}(19,1)*inputIntvl(1,1)+ffnetwork.weight{1}(19,2)*inputIntvl(2,1)+ffnetwork.weight{1}(19,3)*inputIntvl(3,2)+ffnetwork.weight{1}(19,4)*inputIntvl(4,2)+ffnetwork.weight{1}(19,5)*inputIntvl(5,2)+ffnetwork.bias{1}(19);
xmax(20) = ffnetwork.weight{1}(20,1)*inputIntvl(1,2)+ffnetwork.weight{1}(20,2)*inputIntvl(2,2)+ffnetwork.weight{1}(20,3)*inputIntvl(3,2)+ffnetwork.weight{1}(20,4)*inputIntvl(4,2)+ffnetwork.weight{1}(20,5)*inputIntvl(5,2)+ffnetwork.bias{1}(20);
xmin(20) = ffnetwork.weight{1}(20,1)*inputIntvl(1,1)+ffnetwork.weight{1}(20,2)*inputIntvl(2,1)+ffnetwork.weight{1}(20,3)*inputIntvl(3,1)+ffnetwork.weight{1}(20,4)*inputIntvl(4,1)+ffnetwork.weight{1}(20,5)*inputIntvl(5,1)+ffnetwork.bias{1}(20);
y(:,1) = activation(xmin,ffnetwork.activeFcn{1});
y(:,2) = activation(xmax,ffnetwork.activeFcn{1});
case 2
xmax(1) = ffnetwork.weight{2}(1,1)*inputIntvl(1,1)+ffnetwork.weight{2}(1,2)*inputIntvl(2,1)+ffnetwork.weight{2}(1,3)*inputIntvl(3,2)+ffnetwork.weight{2}(1,4)*inputIntvl(4,1)+ffnetwork.weight{2}(1,5)*inputIntvl(5,1)+ffnetwork.weight{2}(1,6)*inputIntvl(6,1)+ffnetwork.weight{2}(1,7)*inputIntvl(7,1)+ffnetwork.weight{2}(1,8)*inputIntvl(8,1)+ffnetwork.weight{2}(1,9)*inputIntvl(9,1)+ffnetwork.weight{2}(1,10)*inputIntvl(10,2)+ffnetwork.weight{2}(1,11)*inputIntvl(11,1)+ffnetwork.weight{2}(1,12)*inputIntvl(12,1)+ffnetwork.weight{2}(1,13)*inputIntvl(13,1)+ffnetwork.weight{2}(1,14)*inputIntvl(14,1)+ffnetwork.weight{2}(1,15)*inputIntvl(15,2)+ffnetwork.weight{2}(1,16)*inputIntvl(16,1)+ffnetwork.weight{2}(1,17)*inputIntvl(17,2)+ffnetwork.weight{2}(1,18)*inputIntvl(18,1)+ffnetwork.weight{2}(1,19)*inputIntvl(19,1)+ffnetwork.weight{2}(1,20)*inputIntvl(20,1)+ffnetwork.bias{2}(1);
xmin(1) = ffnetwork.weight{2}(1,1)*inputIntvl(1,2)+ffnetwork.weight{2}(1,2)*inputIntvl(2,2)+ffnetwork.weight{2}(1,3)*inputIntvl(3,1)+ffnetwork.weight{2}(1,4)*inputIntvl(4,2)+ffnetwork.weight{2}(1,5)*inputIntvl(5,2)+ffnetwork.weight{2}(1,6)*inputIntvl(6,2)+ffnetwork.weight{2}(1,7)*inputIntvl(7,2)+ffnetwork.weight{2}(1,8)*inputIntvl(8,2)+ffnetwork.weight{2}(1,9)*inputIntvl(9,2)+ffnetwork.weight{2}(1,10)*inputIntvl(10,1)+ffnetwork.weight{2}(1,11)*inputIntvl(11,2)+ffnetwork.weight{2}(1,12)*inputIntvl(12,2)+ffnetwork.weight{2}(1,13)*inputIntvl(13,2)+ffnetwork.weight{2}(1,14)*inputIntvl(14,2)+ffnetwork.weight{2}(1,15)*inputIntvl(15,1)+ffnetwork.weight{2}(1,16)*inputIntvl(16,2)+ffnetwork.weight{2}(1,17)*inputIntvl(17,1)+ffnetwork.weight{2}(1,18)*inputIntvl(18,2)+ffnetwork.weight{2}(1,19)*inputIntvl(19,2)+ffnetwork.weight{2}(1,20)*inputIntvl(20,2)+ffnetwork.bias{2}(1);
y(:,1) = activation(xmin,ffnetwork.activeFcn{2});
y(:,2) = activation(xmax,ffnetwork.activeFcn{2});
end

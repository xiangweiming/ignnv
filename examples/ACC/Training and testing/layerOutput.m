function y = layerOutput(ffnetwork,inputInterval,numLayer)
switch numLayer
case 1
xmax(1) = ffnetwork.weight{1}(1,1)*inputInterval(1,1)+ffnetwork.weight{1}(1,2)*inputInterval(1,2)+ffnetwork.weight{1}(1,3)*inputInterval(1,3)+ffnetwork.weight{1}(1,4)*inputInterval(2,4)+ffnetwork.weight{1}(1,5)*inputInterval(1,5)+ffnetwork.bias{1}(1);
xmin(1) = ffnetwork.weight{1}(1,1)*inputInterval(2,1)+ffnetwork.weight{1}(1,2)*inputInterval(2,2)+ffnetwork.weight{1}(1,3)*inputInterval(2,3)+ffnetwork.weight{1}(1,4)*inputInterval(1,4)+ffnetwork.weight{1}(1,5)*inputInterval(2,5)+ffnetwork.bias{1}(1);
xmax(2) = ffnetwork.weight{1}(2,1)*inputInterval(2,1)+ffnetwork.weight{1}(2,2)*inputInterval(2,2)+ffnetwork.weight{1}(2,3)*inputInterval(1,3)+ffnetwork.weight{1}(2,4)*inputInterval(1,4)+ffnetwork.weight{1}(2,5)*inputInterval(2,5)+ffnetwork.bias{1}(2);
xmin(2) = ffnetwork.weight{1}(2,1)*inputInterval(1,1)+ffnetwork.weight{1}(2,2)*inputInterval(1,2)+ffnetwork.weight{1}(2,3)*inputInterval(2,3)+ffnetwork.weight{1}(2,4)*inputInterval(2,4)+ffnetwork.weight{1}(2,5)*inputInterval(1,5)+ffnetwork.bias{1}(2);
xmax(3) = ffnetwork.weight{1}(3,1)*inputInterval(1,1)+ffnetwork.weight{1}(3,2)*inputInterval(1,2)+ffnetwork.weight{1}(3,3)*inputInterval(2,3)+ffnetwork.weight{1}(3,4)*inputInterval(2,4)+ffnetwork.weight{1}(3,5)*inputInterval(1,5)+ffnetwork.bias{1}(3);
xmin(3) = ffnetwork.weight{1}(3,1)*inputInterval(2,1)+ffnetwork.weight{1}(3,2)*inputInterval(2,2)+ffnetwork.weight{1}(3,3)*inputInterval(1,3)+ffnetwork.weight{1}(3,4)*inputInterval(1,4)+ffnetwork.weight{1}(3,5)*inputInterval(2,5)+ffnetwork.bias{1}(3);
xmax(4) = ffnetwork.weight{1}(4,1)*inputInterval(2,1)+ffnetwork.weight{1}(4,2)*inputInterval(2,2)+ffnetwork.weight{1}(4,3)*inputInterval(1,3)+ffnetwork.weight{1}(4,4)*inputInterval(1,4)+ffnetwork.weight{1}(4,5)*inputInterval(1,5)+ffnetwork.bias{1}(4);
xmin(4) = ffnetwork.weight{1}(4,1)*inputInterval(1,1)+ffnetwork.weight{1}(4,2)*inputInterval(1,2)+ffnetwork.weight{1}(4,3)*inputInterval(2,3)+ffnetwork.weight{1}(4,4)*inputInterval(2,4)+ffnetwork.weight{1}(4,5)*inputInterval(2,5)+ffnetwork.bias{1}(4);
xmax(5) = ffnetwork.weight{1}(5,1)*inputInterval(2,1)+ffnetwork.weight{1}(5,2)*inputInterval(2,2)+ffnetwork.weight{1}(5,3)*inputInterval(1,3)+ffnetwork.weight{1}(5,4)*inputInterval(2,4)+ffnetwork.weight{1}(5,5)*inputInterval(1,5)+ffnetwork.bias{1}(5);
xmin(5) = ffnetwork.weight{1}(5,1)*inputInterval(1,1)+ffnetwork.weight{1}(5,2)*inputInterval(1,2)+ffnetwork.weight{1}(5,3)*inputInterval(2,3)+ffnetwork.weight{1}(5,4)*inputInterval(1,4)+ffnetwork.weight{1}(5,5)*inputInterval(2,5)+ffnetwork.bias{1}(5);
xmax(6) = ffnetwork.weight{1}(6,1)*inputInterval(1,1)+ffnetwork.weight{1}(6,2)*inputInterval(1,2)+ffnetwork.weight{1}(6,3)*inputInterval(2,3)+ffnetwork.weight{1}(6,4)*inputInterval(1,4)+ffnetwork.weight{1}(6,5)*inputInterval(1,5)+ffnetwork.bias{1}(6);
xmin(6) = ffnetwork.weight{1}(6,1)*inputInterval(2,1)+ffnetwork.weight{1}(6,2)*inputInterval(2,2)+ffnetwork.weight{1}(6,3)*inputInterval(1,3)+ffnetwork.weight{1}(6,4)*inputInterval(2,4)+ffnetwork.weight{1}(6,5)*inputInterval(2,5)+ffnetwork.bias{1}(6);
xmax(7) = ffnetwork.weight{1}(7,1)*inputInterval(1,1)+ffnetwork.weight{1}(7,2)*inputInterval(1,2)+ffnetwork.weight{1}(7,3)*inputInterval(1,3)+ffnetwork.weight{1}(7,4)*inputInterval(2,4)+ffnetwork.weight{1}(7,5)*inputInterval(1,5)+ffnetwork.bias{1}(7);
xmin(7) = ffnetwork.weight{1}(7,1)*inputInterval(2,1)+ffnetwork.weight{1}(7,2)*inputInterval(2,2)+ffnetwork.weight{1}(7,3)*inputInterval(2,3)+ffnetwork.weight{1}(7,4)*inputInterval(1,4)+ffnetwork.weight{1}(7,5)*inputInterval(2,5)+ffnetwork.bias{1}(7);
xmax(8) = ffnetwork.weight{1}(8,1)*inputInterval(1,1)+ffnetwork.weight{1}(8,2)*inputInterval(1,2)+ffnetwork.weight{1}(8,3)*inputInterval(1,3)+ffnetwork.weight{1}(8,4)*inputInterval(2,4)+ffnetwork.weight{1}(8,5)*inputInterval(2,5)+ffnetwork.bias{1}(8);
xmin(8) = ffnetwork.weight{1}(8,1)*inputInterval(2,1)+ffnetwork.weight{1}(8,2)*inputInterval(2,2)+ffnetwork.weight{1}(8,3)*inputInterval(2,3)+ffnetwork.weight{1}(8,4)*inputInterval(1,4)+ffnetwork.weight{1}(8,5)*inputInterval(1,5)+ffnetwork.bias{1}(8);
xmax(9) = ffnetwork.weight{1}(9,1)*inputInterval(2,1)+ffnetwork.weight{1}(9,2)*inputInterval(2,2)+ffnetwork.weight{1}(9,3)*inputInterval(2,3)+ffnetwork.weight{1}(9,4)*inputInterval(1,4)+ffnetwork.weight{1}(9,5)*inputInterval(2,5)+ffnetwork.bias{1}(9);
xmin(9) = ffnetwork.weight{1}(9,1)*inputInterval(1,1)+ffnetwork.weight{1}(9,2)*inputInterval(1,2)+ffnetwork.weight{1}(9,3)*inputInterval(1,3)+ffnetwork.weight{1}(9,4)*inputInterval(2,4)+ffnetwork.weight{1}(9,5)*inputInterval(1,5)+ffnetwork.bias{1}(9);
xmax(10) = ffnetwork.weight{1}(10,1)*inputInterval(1,1)+ffnetwork.weight{1}(10,2)*inputInterval(1,2)+ffnetwork.weight{1}(10,3)*inputInterval(2,3)+ffnetwork.weight{1}(10,4)*inputInterval(1,4)+ffnetwork.weight{1}(10,5)*inputInterval(2,5)+ffnetwork.bias{1}(10);
xmin(10) = ffnetwork.weight{1}(10,1)*inputInterval(2,1)+ffnetwork.weight{1}(10,2)*inputInterval(2,2)+ffnetwork.weight{1}(10,3)*inputInterval(1,3)+ffnetwork.weight{1}(10,4)*inputInterval(2,4)+ffnetwork.weight{1}(10,5)*inputInterval(1,5)+ffnetwork.bias{1}(10);
xmax(11) = ffnetwork.weight{1}(11,1)*inputInterval(2,1)+ffnetwork.weight{1}(11,2)*inputInterval(2,2)+ffnetwork.weight{1}(11,3)*inputInterval(1,3)+ffnetwork.weight{1}(11,4)*inputInterval(1,4)+ffnetwork.weight{1}(11,5)*inputInterval(1,5)+ffnetwork.bias{1}(11);
xmin(11) = ffnetwork.weight{1}(11,1)*inputInterval(1,1)+ffnetwork.weight{1}(11,2)*inputInterval(1,2)+ffnetwork.weight{1}(11,3)*inputInterval(2,3)+ffnetwork.weight{1}(11,4)*inputInterval(2,4)+ffnetwork.weight{1}(11,5)*inputInterval(2,5)+ffnetwork.bias{1}(11);
xmax(12) = ffnetwork.weight{1}(12,1)*inputInterval(1,1)+ffnetwork.weight{1}(12,2)*inputInterval(1,2)+ffnetwork.weight{1}(12,3)*inputInterval(1,3)+ffnetwork.weight{1}(12,4)*inputInterval(2,4)+ffnetwork.weight{1}(12,5)*inputInterval(1,5)+ffnetwork.bias{1}(12);
xmin(12) = ffnetwork.weight{1}(12,1)*inputInterval(2,1)+ffnetwork.weight{1}(12,2)*inputInterval(2,2)+ffnetwork.weight{1}(12,3)*inputInterval(2,3)+ffnetwork.weight{1}(12,4)*inputInterval(1,4)+ffnetwork.weight{1}(12,5)*inputInterval(2,5)+ffnetwork.bias{1}(12);
xmax(13) = ffnetwork.weight{1}(13,1)*inputInterval(2,1)+ffnetwork.weight{1}(13,2)*inputInterval(2,2)+ffnetwork.weight{1}(13,3)*inputInterval(1,3)+ffnetwork.weight{1}(13,4)*inputInterval(2,4)+ffnetwork.weight{1}(13,5)*inputInterval(2,5)+ffnetwork.bias{1}(13);
xmin(13) = ffnetwork.weight{1}(13,1)*inputInterval(1,1)+ffnetwork.weight{1}(13,2)*inputInterval(1,2)+ffnetwork.weight{1}(13,3)*inputInterval(2,3)+ffnetwork.weight{1}(13,4)*inputInterval(1,4)+ffnetwork.weight{1}(13,5)*inputInterval(1,5)+ffnetwork.bias{1}(13);
xmax(14) = ffnetwork.weight{1}(14,1)*inputInterval(2,1)+ffnetwork.weight{1}(14,2)*inputInterval(2,2)+ffnetwork.weight{1}(14,3)*inputInterval(1,3)+ffnetwork.weight{1}(14,4)*inputInterval(2,4)+ffnetwork.weight{1}(14,5)*inputInterval(1,5)+ffnetwork.bias{1}(14);
xmin(14) = ffnetwork.weight{1}(14,1)*inputInterval(1,1)+ffnetwork.weight{1}(14,2)*inputInterval(1,2)+ffnetwork.weight{1}(14,3)*inputInterval(2,3)+ffnetwork.weight{1}(14,4)*inputInterval(1,4)+ffnetwork.weight{1}(14,5)*inputInterval(2,5)+ffnetwork.bias{1}(14);
xmax(15) = ffnetwork.weight{1}(15,1)*inputInterval(1,1)+ffnetwork.weight{1}(15,2)*inputInterval(1,2)+ffnetwork.weight{1}(15,3)*inputInterval(1,3)+ffnetwork.weight{1}(15,4)*inputInterval(2,4)+ffnetwork.weight{1}(15,5)*inputInterval(1,5)+ffnetwork.bias{1}(15);
xmin(15) = ffnetwork.weight{1}(15,1)*inputInterval(2,1)+ffnetwork.weight{1}(15,2)*inputInterval(2,2)+ffnetwork.weight{1}(15,3)*inputInterval(2,3)+ffnetwork.weight{1}(15,4)*inputInterval(1,4)+ffnetwork.weight{1}(15,5)*inputInterval(2,5)+ffnetwork.bias{1}(15);
xmax(16) = ffnetwork.weight{1}(16,1)*inputInterval(1,1)+ffnetwork.weight{1}(16,2)*inputInterval(1,2)+ffnetwork.weight{1}(16,3)*inputInterval(1,3)+ffnetwork.weight{1}(16,4)*inputInterval(1,4)+ffnetwork.weight{1}(16,5)*inputInterval(2,5)+ffnetwork.bias{1}(16);
xmin(16) = ffnetwork.weight{1}(16,1)*inputInterval(2,1)+ffnetwork.weight{1}(16,2)*inputInterval(2,2)+ffnetwork.weight{1}(16,3)*inputInterval(2,3)+ffnetwork.weight{1}(16,4)*inputInterval(2,4)+ffnetwork.weight{1}(16,5)*inputInterval(1,5)+ffnetwork.bias{1}(16);
xmax(17) = ffnetwork.weight{1}(17,1)*inputInterval(2,1)+ffnetwork.weight{1}(17,2)*inputInterval(2,2)+ffnetwork.weight{1}(17,3)*inputInterval(1,3)+ffnetwork.weight{1}(17,4)*inputInterval(1,4)+ffnetwork.weight{1}(17,5)*inputInterval(1,5)+ffnetwork.bias{1}(17);
xmin(17) = ffnetwork.weight{1}(17,1)*inputInterval(1,1)+ffnetwork.weight{1}(17,2)*inputInterval(1,2)+ffnetwork.weight{1}(17,3)*inputInterval(2,3)+ffnetwork.weight{1}(17,4)*inputInterval(2,4)+ffnetwork.weight{1}(17,5)*inputInterval(2,5)+ffnetwork.bias{1}(17);
xmax(18) = ffnetwork.weight{1}(18,1)*inputInterval(1,1)+ffnetwork.weight{1}(18,2)*inputInterval(1,2)+ffnetwork.weight{1}(18,3)*inputInterval(1,3)+ffnetwork.weight{1}(18,4)*inputInterval(1,4)+ffnetwork.weight{1}(18,5)*inputInterval(2,5)+ffnetwork.bias{1}(18);
xmin(18) = ffnetwork.weight{1}(18,1)*inputInterval(2,1)+ffnetwork.weight{1}(18,2)*inputInterval(2,2)+ffnetwork.weight{1}(18,3)*inputInterval(2,3)+ffnetwork.weight{1}(18,4)*inputInterval(2,4)+ffnetwork.weight{1}(18,5)*inputInterval(1,5)+ffnetwork.bias{1}(18);
xmax(19) = ffnetwork.weight{1}(19,1)*inputInterval(2,1)+ffnetwork.weight{1}(19,2)*inputInterval(2,2)+ffnetwork.weight{1}(19,3)*inputInterval(2,3)+ffnetwork.weight{1}(19,4)*inputInterval(2,4)+ffnetwork.weight{1}(19,5)*inputInterval(1,5)+ffnetwork.bias{1}(19);
xmin(19) = ffnetwork.weight{1}(19,1)*inputInterval(1,1)+ffnetwork.weight{1}(19,2)*inputInterval(1,2)+ffnetwork.weight{1}(19,3)*inputInterval(1,3)+ffnetwork.weight{1}(19,4)*inputInterval(1,4)+ffnetwork.weight{1}(19,5)*inputInterval(2,5)+ffnetwork.bias{1}(19);
xmax(20) = ffnetwork.weight{1}(20,1)*inputInterval(2,1)+ffnetwork.weight{1}(20,2)*inputInterval(2,2)+ffnetwork.weight{1}(20,3)*inputInterval(2,3)+ffnetwork.weight{1}(20,4)*inputInterval(2,4)+ffnetwork.weight{1}(20,5)*inputInterval(1,5)+ffnetwork.bias{1}(20);
xmin(20) = ffnetwork.weight{1}(20,1)*inputInterval(1,1)+ffnetwork.weight{1}(20,2)*inputInterval(1,2)+ffnetwork.weight{1}(20,3)*inputInterval(1,3)+ffnetwork.weight{1}(20,4)*inputInterval(1,4)+ffnetwork.weight{1}(20,5)*inputInterval(2,5)+ffnetwork.bias{1}(20);
y(1,:) = activation(xmin,ffnetwork.activeFun{1});
y(2,:) = activation(xmax,ffnetwork.activeFun{1});
case 2
xmax(1) = ffnetwork.weight{2}(1,1)*inputInterval(1,1)+ffnetwork.weight{2}(1,2)*inputInterval(2,2)+ffnetwork.weight{2}(1,3)*inputInterval(2,3)+ffnetwork.weight{2}(1,4)*inputInterval(1,4)+ffnetwork.weight{2}(1,5)*inputInterval(1,5)+ffnetwork.weight{2}(1,6)*inputInterval(1,6)+ffnetwork.weight{2}(1,7)*inputInterval(1,7)+ffnetwork.weight{2}(1,8)*inputInterval(1,8)+ffnetwork.weight{2}(1,9)*inputInterval(1,9)+ffnetwork.weight{2}(1,10)*inputInterval(1,10)+ffnetwork.weight{2}(1,11)*inputInterval(1,11)+ffnetwork.weight{2}(1,12)*inputInterval(2,12)+ffnetwork.weight{2}(1,13)*inputInterval(2,13)+ffnetwork.weight{2}(1,14)*inputInterval(1,14)+ffnetwork.weight{2}(1,15)*inputInterval(2,15)+ffnetwork.weight{2}(1,16)*inputInterval(2,16)+ffnetwork.weight{2}(1,17)*inputInterval(1,17)+ffnetwork.weight{2}(1,18)*inputInterval(2,18)+ffnetwork.weight{2}(1,19)*inputInterval(1,19)+ffnetwork.weight{2}(1,20)*inputInterval(2,20)+ffnetwork.bias{2}(1);
xmin(1) = ffnetwork.weight{2}(1,1)*inputInterval(2,1)+ffnetwork.weight{2}(1,2)*inputInterval(1,2)+ffnetwork.weight{2}(1,3)*inputInterval(1,3)+ffnetwork.weight{2}(1,4)*inputInterval(2,4)+ffnetwork.weight{2}(1,5)*inputInterval(2,5)+ffnetwork.weight{2}(1,6)*inputInterval(2,6)+ffnetwork.weight{2}(1,7)*inputInterval(2,7)+ffnetwork.weight{2}(1,8)*inputInterval(2,8)+ffnetwork.weight{2}(1,9)*inputInterval(2,9)+ffnetwork.weight{2}(1,10)*inputInterval(2,10)+ffnetwork.weight{2}(1,11)*inputInterval(2,11)+ffnetwork.weight{2}(1,12)*inputInterval(1,12)+ffnetwork.weight{2}(1,13)*inputInterval(1,13)+ffnetwork.weight{2}(1,14)*inputInterval(2,14)+ffnetwork.weight{2}(1,15)*inputInterval(1,15)+ffnetwork.weight{2}(1,16)*inputInterval(1,16)+ffnetwork.weight{2}(1,17)*inputInterval(2,17)+ffnetwork.weight{2}(1,18)*inputInterval(1,18)+ffnetwork.weight{2}(1,19)*inputInterval(2,19)+ffnetwork.weight{2}(1,20)*inputInterval(1,20)+ffnetwork.bias{2}(1);
y(1,:) = activation(xmin,ffnetwork.activeFun{2});
y(2,:) = activation(xmax,ffnetwork.activeFun{2});
end

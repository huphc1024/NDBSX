x = imread('img/6.jpg');
[bienso, biensomau] = laybiensohoanchinh(x);
imshow(bienso); %bien so da xu ly
%figure;
%imshow(biensomau);%bien so mau
%figure;
%Phan vung ki tu
[hang1, hang2] = phanvungchu(bienso);
figure;
imshow(hang1); %hang 1 cua bien so
figure;
imshow(hang2); %hang 2 cua bien so
seg1 = character_segmentation(hang1);
seg2 = character_segmentation2(hang2);
ketquaphanvung1(hang1,hang2,seg1,seg2);
load 'netso.mat'
load 'netchu.mat';
num1 = nhandangsonoron1(hang1, seg1, netso);
num2 = nhandangsonoron2(hang2, seg2, netso);
disp(num1);
disp(num2);

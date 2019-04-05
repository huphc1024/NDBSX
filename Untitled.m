x = imread('img/1.jpg');
[bienso, biensomau] = laybiensohoanchinh(x);
ho=figure('position',[200 150 500 400],'NumberTitle','off','Name','KET QUA CAT BIEN SO',...
    'MenuBar','None','color',[0.8 0.8 0.8 0.8]);
subplot(121);
imshow(biensomau);%bien so mau
subplot(122);
imshow(bienso); %bien so

%Phan vung ki tu
[hang1, hang2] = phanvungchu(bienso);
ho=figure('position',[200 150 500 400],'NumberTitle','off','Name','PHAN HANG BIEN SO',...
    'MenuBar','None','color',[0.8 0.8 0.8 0.8]);
subplot(121);
imshow(hang1); %hang 1 cua bien so
subplot(122);
imshow(hang2); %hang 2 cua bien so
seg1 = character_segmentation(hang1);
seg2 = character_segmentation2(hang2);
ketquaphanvung1(hang1,hang2,seg1,seg2);
load netso.mat;
num1 = nhandangsonoron1(hang1, seg1, netso);
num2 = nhandangsonoron2(hang2, seg2, netso);
disp(num1);
disp(num2);

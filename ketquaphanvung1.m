function ketquaphanvung1(hang1,hang2,seg1,seg2)
ho=figure('position',[200 150 500 400],'NumberTitle','off','Name','KET QUA PHAN VUNG',...
    'MenuBar','None','color',[0.8 0.8 0.8 0.8]);
subplot(1,9,1)
 imshow(hang1(:,seg1(1,1):seg1(1,2)));
 subplot(1,9,2)

 imshow(hang1(:,seg1(2,1):seg1(2,2)))
 subplot(1,9,3)

 imshow(hang1(:,seg1(3,1):seg1(3,2)))
subplot(1,9,4)

imshow(hang1(:,seg1(4,1):seg1(4,2)))
subplot(1,9,5)

 imshow(hang2(:,seg2(1,1):seg2(1,2)))
 subplot(1,9,6)

 imshow(hang2(:,seg2(2,1):seg2(2,2)))
subplot(1,9,7)

 imshow(hang2(:,seg2(3,1):seg2(3,2)))
subplot(1,9,8)

 imshow(hang2(:,seg2(4,1):seg2(4,2)))
 subplot(1,9,9)

 imshow(hang2(:,seg2(5,1):seg2(5,2)))

 return
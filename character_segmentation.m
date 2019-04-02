function [seg] = character_segmentation(bw);
DIGIT_WIDTH =28;
MIN_AREA = 200;
seg = phanvung(bw, DIGIT_WIDTH, MIN_AREA);
[x y] = size(seg);
if x < 4
 for i = 1 : x
 bw(:,seg(i,2))=0;
 end;
 seg = phanvung(bw, DIGIT_WIDTH, MIN_AREA);
end;
area = [];
for i = 1 : x 

 pic = bw(:, seg(i,1) : seg(i,2), :);
 area(i) = bwarea(pic);
end;
area1 = sort(area);
seg = seg';

for j = 1:(length(area1)-4)
 i = find(area == area1(j));
 len = length(area);
 if i == 1
 area = [area(2:len)];
 seg = [seg(:,2:len)];
 elseif i == len
 area = [area(1:i-1)];
 seg = [seg(:,1:i-1)];
 else
 area = [area(1:i-1) area(i+1:len)];
 seg = [seg(:,1:i-1) seg(:,i+1:len)];
 end;
end;
seg = seg';
return;
function [pic, x1, x2, y1, y2] = improved_lp_area(image, angle);
[x1,x2,y1,y2] = detect_lp_area(image, 0);
pic = image(y1:y2, x1:x2);
return;
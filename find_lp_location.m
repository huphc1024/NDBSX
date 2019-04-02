function [rec] = find_lp_location(im);
p1 = sum(im);
[x1, x2] = find_contours(p1);
p2 = sum(im');
[y1, y2] = find_contours(p2);
rec = [x1, y1, x2-x1, y2-y1];
return; 
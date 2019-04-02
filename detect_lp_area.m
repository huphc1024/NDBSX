function [x, x2, y, y2] = detect_lp_area (white_pic, spacing);
 LP_MIN_AREA = 15000;
 LP_MAX_AREA=74200;
 LP_MAX_RATIO = 0.8;
 LP_MIN_RATIO = 0.7;
 dilated_pic = imdilate(white_pic, strel('diamond', 5));
 stat = regionprops(bwlabel(dilated_pic));
 depth = -1;
 for i = 1 : length([stat.Area])
 if stat(i).BoundingBox(2) >= depth && stat(i).Area > LP_MIN_AREA && ...
 stat(i).BoundingBox(4) <= LP_MAX_RATIO*stat(i).BoundingBox(3) && ...
 stat(i).BoundingBox(4) >= (LP_MIN_RATIO)*stat(i).BoundingBox(3) && stat(i).Area >= max([stat.Area])/3.5
 depth = stat(i).BoundingBox(2);
 end;
 end; 
 r = [];
 for i = 1 : length([stat.Area])
 if stat(i).BoundingBox(2) == depth && stat(i).Area > LP_MIN_AREA && ...
 stat(i).BoundingBox(4) <= LP_MAX_RATIO*stat(i).BoundingBox(3) && ...
 stat(i).BoundingBox(4) >= (LP_MIN_RATIO)*stat(i).BoundingBox(3) && stat(i).Area >= max([stat.Area])/3.5
 r = [r stat(i).Area];
 end;
 end;
 if(length(r) == 0)
 index = (find([stat.Area] == max([stat.Area])));
 else
 index = (find([stat.Area] == max(r)));
 end;
 x = max(floor(stat(index).BoundingBox(1) - spacing), 1);
 y = max(floor(stat(index).BoundingBox(2) - spacing), 1);
 width = ceil(stat(index).BoundingBox(3) + 2*spacing);
 height = ceil(stat(index).BoundingBox(4) + 2*spacing);
 y2 = min(y + height, size(white_pic, 1));
 x2 = min(x + width, size(white_pic, 2));
return; 
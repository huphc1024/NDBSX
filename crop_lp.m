function [image, RECTx, RECTy] = crop_lp(pic, lp_area, x1, x2, y1, y2, angle);
rec = find_lp_location(pic);
image = imrotate(lp_area, angle, 'bilinear');
image = image(y1:y2, x1:x2, :);
RECTy = [rec(2), rec(2), rec(2) + rec(4), rec(2) + rec(4)];
RECTx = [rec(1), rec(1) + rec(3), rec(1) + rec(3), rec(1)];
image = imcrop(image, rec);
return; 

function [bienso,biensomau]=laybiensohoanchinh(pic1);
XSIZE = 50;
YSIZE = 150;
white_pic=laybienso(pic1);
[r]=lp_area_extraction_lap(white_pic,30);
n=length(r)/4
for i=1:n
 x=r(4*i-3);
 x2=r(4*i-2);
 y=r(4*i-1);
 y2=r(4*i);
 lp_area = pic1(y:y2, x:x2, :);
 angle = find_angle(lp_area);
 pic = imrotate(white_pic(y:y2, x:x2), angle, 'bilinear');
 [small_pic, xx, xx2, yy, yy2] = improved_lp_area(pic, angle);
 [image, RECTx, RECTy] = crop_lp(small_pic, lp_area, xx, xx2, yy, yy2, angle);
end
 image = imrotate(lp_area, angle, 'bilinear');
 image=image(yy:yy2,xx:xx2,:);
 cao = length(image(:,1,1)) ;
 rong=length(image(1,:,1));
if cao > rong
 image = imrotate(image, -90, 'bilinear');
end
 biensomau = image;
 [grayImage, quantImage, bw] = quantizeImage(image);
 quantImage = imadjust(grayImage, stretchlim(grayImage), [0 1]);
 bienso=bw;
 bienso = normalized_lp_contour(bienso, [XSIZE, YSIZE]); 
return
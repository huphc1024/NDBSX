function [segmentation] = phanvung(im, digit_width, min_area);
segmentation = [];
t = sum(im);
seg = clean(vitricuctieu(t, 2, 1, digit_width), 3);
j = 1;
for i = 1 : (length(seg) - 1)
 band_width = seg(i+1) - seg(i);
 maxi = max(t(1, seg(i):seg(i+1)));
 if(maxi * band_width > min_area)
 segmentation(j, 1) = seg(i);
 segmentation(j, 2) = seg(i+1);
 j = j + 1;
 end;
end;
return; 
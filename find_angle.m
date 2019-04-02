function [angle] = find_angle(rgb_image); %TÌM GÓC XOAY
 gray_image = rgb2gray(rgb_image);
 theta = (0:179)';
 [R, xp] = radon(edge(gray_image), theta);
 i = find(R > (max(R(:)) - 25));
 [foo, ind] = sort(-R(i));
 [y, x] = ind2sub(size(R), i);
 t = -theta(x)*pi/180;
 r = xp(y);
 [r,c] = find(R == max(R(:)));
 thetap = theta(c(1));
 angle = 90 - thetap;
return; 
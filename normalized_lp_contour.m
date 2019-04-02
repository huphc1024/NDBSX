function [im] = normalized_lp_contour(bwImage, dimension);
im=imcomplement(bwImage);
im = imresize(im, dimension);
im=im(3:48,11:140);
im = imresize(im, dimension);
return;
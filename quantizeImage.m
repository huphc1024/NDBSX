function [grayImage, quantImage, bw] = quantizeImage(rgbImage);
grayImage = rgb2gray(rgbImage);
quantImage = imadjust(grayImage, stretchlim(grayImage), [0 1]);
quantImage = im2double(quantImage);
op = find_optimal_threshold(quantImage);
bw = im2bw(quantImage, op);
return; 
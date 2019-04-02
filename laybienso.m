function [vungbienso]=laybienso(x) %C?T THÔ
 mucxam=rgb2gray(x);
 mucxam=medfilt2(mucxam,[3 3]);
 threshold=graythresh(mucxam);
 bw = im2bw(mucxam,threshold);
 bw = bwareaopen(bw,5000);
 vungbienso = bw;
return
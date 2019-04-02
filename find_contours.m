function [index1, index2] = find_contours(vec);
avg = mean(vec);
for j = 1 : length(vec)
 if(vec(1,j) <= avg)
 continue;
 end;
 index1 = j - 1;
 break; 

end;
for j = length(vec) : -1 : 1
 if(vec(1,j) <= avg)
 continue;
 end;
 index2 = j + 1;
 break;
end;
return;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [grayImage, quantImage, bw] = quantizeImage(rgbImage);
grayImage = rgb2gray(rgbImage);
quantImage = imadjust(grayImage, stretchlim(grayImage), [0 1]);
quantImage = im2double(quantImage);
op = find_optimal_threshold(quantImage);
bw = im2bw(quantImage, op);
return; 
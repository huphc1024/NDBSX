function threshold = find_optimal_threshold(gray_image)
%*********************************************************************************

%*********************************************************************************


[rows, cols] = size(gray_image);


col_c = floor(cols/10);
rows_c = floor(rows/10);
corners = [gray_image(1:rows_c,1:col_c); gray_image(1:rows_c,(end-col_c+1):end);...
         gray_image((end-rows_c+1):end,1:col_c);gray_image((end-rows_c+1):end,(end-col_c+1):end)];
threshold = mean(mean(corners));

while 1
  
  mean_obj = sum(sum((gray_image > threshold).*gray_image))/length(find(gray_image > threshold));

  mean_backgnd = sum(sum( (gray_image <= threshold).*gray_image ))/length(find(gray_image <= threshold));

  new_threshold = (mean_obj + mean_backgnd)/2;

  if(new_threshold == threshold)
     break;   
  else
     threshold = new_threshold;
  end
end
return;
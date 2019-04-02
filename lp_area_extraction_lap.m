function [r]=lp_area_extraction_lap(white_pic,spacing) 
    LP_MIN_AREA = 16000; 
    LP_MAX_AREA=61000; 
    LP_MAX_RATIO = 0.91; 
    LP_MIN_RATIO = 0.74; 
     
    % Dilating the white regions: 
    %dilated_pic = imdilate(white_pic, strel('diamond', 5)); 
       % Separating the pictures into connected components: 
    %stat = imfeature(bwlabel(white_pic)); 
    bw=bwlabel(white_pic); 
    stat=regionprops(bw); 
    a=[]; 
    r=[]; 
     
    % Selecting the license plates from the candidates in stat. 
    % The chosen area is the deepest region in the frame which has the 
    % following properties: 
    %   area > LP_MIN_AREA 
    %   LP_MIN_RATIO <= height/width <= LP_MAX_RATIO  
   
    %depth = -1; 
    for i = 1 : length([stat.Area]) 
         
        S10=stat(i).BoundingBox(3).*stat(i).BoundingBox(4); 
        if stat(i).Area > LP_MIN_AREA&& ... 
           stat(i).BoundingBox(4) <= LP_MAX_RATIO*stat(i).BoundingBox(3) && ... 
           stat(i).BoundingBox(4) >= (LP_MIN_RATIO)*stat(i).BoundingBox(3) &&... 
           0.38<stat(i).Area/S10<0.7; 
       a=[a i] 
       %depth = stat(i).BoundingBox(2); 
        end; 
    end; 
    % finding the components which are at the depth "depth": 
    if length(a)==0; 
        index=find([stat.Area]==max([stat.Area])); 
         x = max(floor(stat(index).BoundingBox(1) - spacing), 1); 
         y = max(floor(stat(index).BoundingBox(2) - spacing), 1); 
         width = ceil(stat(index).BoundingBox(3) + 2*spacing); 
         height = ceil(stat(index).BoundingBox(4) + 2*spacing); 
         y2 = min(y + height, size(white_pic, 1)); 
         x2 = min(x + width, size(white_pic, 2)); 
         r=[r x x2 y y2]; 
    else  
         
      for index = 1 : length(a) 
         x = max(floor(stat(index).BoundingBox(1) - spacing), 1); 
         y = max(floor(stat(index).BoundingBox(2) - spacing), 1); 
         width = ceil(stat(index).BoundingBox(3) + 2*spacing); 
         height = ceil(stat(index).BoundingBox(4) + 2*spacing); 
         y2 = min(y + height, size(white_pic, 1)); 
         x2 = min(x + width, size(white_pic, 2)); 
         r=[r x x2 y y2]; 
      end; 
    end; 
    % if we did not find any region with the above criterion, taking the 
    % candidate of maximum area. 
    %if(length(r) == 0) 
     %   index = (find([stat.Area] == max([stat.Area]))); 
    %else 
        % otherwise, taking the candidate with maximum area from the 
        % filtered candidates: 
     %   index = (find([stat.Area] == max(r))); 
    %end; 
    % set the coordinates of the supposed license plate region: 
    %x = max(floor(stat(index).BoundingBox(1) - spacing), 1); 
    %y = max(floor(stat(index).BoundingBox(2) - spacing), 1); 
    %width = ceil(stat(index).BoundingBox(3) + 2*spacing); 
    %height = ceil(stat(index).BoundingBox(4) + 2*spacing); 
    %y2 = min(y + height, size(white_pic, 1)); 
    %x2 = min(x + width, size(white_pic, 2)); 
 
end

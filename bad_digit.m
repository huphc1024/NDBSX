function [bool] = bad_digit(s, digit_width);
if length(s) == 0
 bool = 0;
 return;
end;
tmp = s(1);
bool = 0;
for i = 2 : length(s)
 if(s(i) - tmp) > digit_width
 bool = 1;
 return;
 end;
 tmp = s(i);
end;
return; 
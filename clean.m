function [t] = clean(s, val);
t = [];
len = length(s);
i = 2;
j = 1;
while i <= len
 while(s(i) - s(i-1) <= val)
 i = i + 1;
 if(i > len)
 return;
 end;
 end;
 if j == 1||s(i-1)-t(j-1) > val
 t(j) = s(i-1); 
 j = j + 1;
 end;
 t(j) = s(i);
 j = j + 1;
 i = i + 1;
end;
return; 
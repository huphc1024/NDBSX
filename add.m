function [t] = add(s, val);
len = length(s);
t = [];
for i = 1:len
 t(i) = s(i) + val;
end;
return; 
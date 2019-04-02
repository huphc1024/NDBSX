function [s] = vitricuctieu(t, val, offset, digit_width);
s = find(t < val);
if(length(s) < 2)
 s = vitricuctieu(t, val + 1, offset, digit_width);
 return;
end;
if((t(1,1) >= val) && s(1) ~= 1)
 s = [1 s]; 

end;
if((t(1, length(t)) >= val) && s(length(s)) ~= length(t))
 s = [s length(t)];
end;
s = add(s, offset - 1);
s = clean(s, 3);
while bad_digit(s, digit_width) == 1
 for i = 1: (length(s) - 1)
 if (s(i + 1) - s(i)) > digit_width
 sub_vec = t(1, s(i) - offset + 1 : s(i+1) - offset + 1);
 s = [s(1 : i) vitricuctieu(sub_vec, val + 1, s(i), digit_width) s(i+1 : length(s))];
 end;
 end;
end;
return; 
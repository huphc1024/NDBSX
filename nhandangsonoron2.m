function number2 = nhandangsonoron2(hang2, seg2, netso)
load 'netso.mat';
%load 'netchu.mat';
number2 = [];
for i = 1:size(seg2, 1)
 input = hang2(:, seg2(i,1) : seg2(i,2), :);
 rec = nhandangsonoron(netso, input);
 number2 = strcat(number2, rec);
end
return; 
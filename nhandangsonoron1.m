function number1 = nhandangsonoron1(hang1, seg1, netso)
load netchuso.mat;
load mangtraingdx.mat;
number1 = [];

for i = 1:size(seg1, 1)
    
    input = hang1(:, seg1(i,1) : seg1(i,2), :);
          
    rec = nhandangsonoron(netso, input);
    
    if i==3
        rec = nhandangchunoron(net, input);
    end
    if i==4
        rec = nhandangchusonoron(netchuso,input);
    end
    number1 = strcat(number1, rec); %ghep tung hang trong number voi rec
end   

return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


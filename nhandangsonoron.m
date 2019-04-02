function so = nhandangsonoron(net,input )
matranmau=[35 20];
input = imresize(input, matranmau, 'nearest');
input=bwareaopen(input,60);
vec = double(im2col(input, size(input), 'distinct'));
rslt = sim(net, vec);
[Y,I] = max(rslt);
num = I-1;
so = char('0' + num);
return; 
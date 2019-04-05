function chu = nhandangchusonoron(net,input )

matranmau=[35 20];

input = imresize(input, matranmau, 'nearest');
input=bwareaopen(input,60);

vec = double(im2col(input, size(input), 'distinct'));

rslt = sim(net, vec);
[Y,I] = max(rslt);
switch I
   
    case 1
        chu='0';
   
    case 2
        chu='1';
  
    case 3
        chu='2';
        
    case 4
        chu='3';
        
    case 5
        chu='4';
        
    case 6
        chu='5'; 
    
    case 7
        chu='6';  
   
    case 8
        chu='7';  
    case 9
        chu='8'; 
        
    case 10
        chu='9'; 
        
    case 11
        chu='A';  
        
    case 12
        chu='E';  
        
    case 13
        chu='D';
        
       otherwise
        chu='';
end

return;
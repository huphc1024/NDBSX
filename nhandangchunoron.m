function chu = nhandangchunoron(net,input )

matranmau=[35 20];

input = imresize(input, matranmau, 'nearest');
input=bwareaopen(input,60);
vec = double(im2col(input, size(input), 'distinct'));

rslt = sim(net, vec);
[Y,I] = max(rslt);
switch I
   
    case 1
        chu='F';
   
    case 2
        chu='H';
  
    case 3
        chu='K';
        
    case 4
        chu='L';
        
    case 5
        chu='M';
        
    case 6
        chu='N'; 
    
    case 7
        chu='P';  
   
    case 8
        chu='R';  
    case 9
        chu='S'; 
        
    case 10
        chu='S';%t 
        
    case 11
        chu='U';  
        
    case 12
        chu='V';  
        
    case 13
        chu='Y';  
        
    case 14
        chu='Z';  
   
    otherwise
        chu='';
end
        
return;
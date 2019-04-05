function chu = nhandangkhoangcachchu(input )
load netchu.mat;
dulieu = {chuF,chuH,chuK,chuL,chuM,chuP,chuS,chuT,chuU,chuV,chuZ};
dem=[0 0 0 0 0 0 0 0 0 0 0];
matranmau=[20 10];
%dinh ngo vao chuan
input=imresize(input,matranmau);

input=im2col(input,size(input));
%dinh du lieu chuan
for k=1:11
dulieu{k}=imresize(dulieu{k},matranmau);
dulieu{k}=im2col(dulieu{k},size(dulieu{k}));
end
for m=1:11
  mau=dulieu{m};
  for i=1:200
       if input(i)< mau(i)|| input(i)>mau(i)
            dem(m)=dem(m)+1;
       end
   end   
end

[Y,I] = min(dem);

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
        chu='P';
    case 7
        chu='S';
    case 8
        chu='T';
    case 9
        chu='U';
    case 10
        chu='V';
    case 11
        chu='Z';
    otherwise
        chu='?';
end
        
return;
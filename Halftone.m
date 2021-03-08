global im
I = im;
[m,n]=size(I);
I=double(I);%转换数据类型
I2=imresize(I,12);%图像放大
[M,N]=size(I2);
B=[28,10,18,26,36,44,52,34;
    22,2,4,12,48,58,60,42;
    14,6,0,20,40,56,62,50;
    24,16,8,30,32,54,46,38;
    37,45,53,35,29,11,19,27;
    49,59,61,43,23,3,5,13;
    41,57,63,51,15,7,1,21;
    33,55,47,39,25,17,9,31];
II=double(I2)/256*64;
for i=1:M
    for j=1:N
         if (II (i,j)<B(mod(i,8)+1,mod(j,8)+1)) 
           II(i,j)=0;
         else 
           II(i,j)=255; 
        end
   end
end
II=uint8(II);
figure;
imshow(II);
imwrite(II,'FM_Halftone.tif','TIFF')
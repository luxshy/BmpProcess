global im
I = im;
[m,n]=size(I);
I=double(I);%转换数据类型
I2=imresize(I,12);%图像放大
[M,N]=size(I2);
B=[64,53,42,26,27,43,54,61;
    60,41,25,14,15,28,44,55;
    52,40,13,5,6,16,29,45;
    39,24,12,1,2,7,17,30;
    38,23,11,4,3,8,18,31;
    51,37,22,10,9,19,32,41;
    59,50,36,21,20,33,47,56;
    63,58,49,35,34,48,57,62];
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
imwrite(II,'FM_Screw.tif','TIFF')
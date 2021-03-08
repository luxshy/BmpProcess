global im
I = im;
[m,n]=size(I);
I=double(I);%转换数据类型
I2=imresize(I,12);%图像放大
[M,N]=size(I2);
B=[0,32,8,40,2,34,10,42;
    48,16,56,42,50,18,58,26;
    12,44,4,36,14,46,6,38;
    60,28,52,20,62,30,54,22;
    3,35,11,43,1,33,9,41;
    51,19,59,27,49,17,57,25;
    15,47,7,39,13,45,5,37;
    63,31,55,23,61,29,53,21];
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
imwrite(II,'D8_testchart.tif','TIFF')
global im
I = im;
[m,n]=size(I);
I=double(I);%转换数据类型
I2=imresize(I,12);%图像放大
[M,N]=size(I2);
B=[4,14,52,58,56,45,20,6;
      16,26,38,50,48,36,28,18;
      43,35,31,9,11,25,33,41;
      61,46,23,1,3,13,55,60;
      57,47,21,7,5,15,53,59;
      49,37,29,19,17,27,39,51;
      10,24,32,40,42,34,30,8;
      2,12,54,60,51,44,22,0];
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
imwrite(II,'CF_B_M.tif','TIFF')
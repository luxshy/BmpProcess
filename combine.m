
C=imread('C.tif');%读取各通道图片
M=imread('M.tif');
Y=imread('Y.tif');
K=imread('K.tif');


CMYK(:,:,1)=C;
CMYK(:,:,2)=M;
CMYK(:,:,3)=Y;
CMYK(:,:,4)=K;

imwrite(CMYK,'CMYK.tif');
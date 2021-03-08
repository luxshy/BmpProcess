
global C1
[filename,pathname] = uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'select photo');
str=[pathname,filename];
C1=imread(str);
figure;
imshow(C1);
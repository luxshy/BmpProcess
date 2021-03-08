clear
clc
global im
[filename,pathname] = uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif;*.tiff'},'select photo');
str=[pathname,filename];
im=imread(str);
figure;
imshow(im)
clear;
global im
global C1

X =im;
Y =C1;
figure;
subplot(1, 3, 1); imshow(X); title('q1');
subplot(1, 3, 2); imshow(Y); title('q2');
%                                  使得图像每个像素值为浮点型
X = double(X); 
Y = double(Y);

A = Y-X;
B = X.*Y;
subplot(1,3,3);imshow(A);title('作差');
MSE = sum(A(:).*A(:))/numel(Y);%  均方根误差MSE，numel()函数返回矩阵元素个数  
SNR = 10*log10(sum(X(:).*X(:))/MSE/numel(Y));%信噪比SNR
PSNR = 10*log10(255^2/MSE);%      峰值信噪比PSNR
SSIM = ssim(X,Y);
wsnr = WSNR(X,Y);

display(MSE);%均方根误差MSE
display(SNR);%信噪比SNR
display(PSNR);%峰值信噪比PSNR
display(SSIM);%结构相似性SSIM
display(wsnr);%加权信噪比WSNR



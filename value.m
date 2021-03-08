clear;
global im
global C1

X =im;
Y =C1;
figure;
subplot(1, 3, 1); imshow(X); title('q1');
subplot(1, 3, 2); imshow(Y); title('q2');
%                                  ʹ��ͼ��ÿ������ֵΪ������
X = double(X); 
Y = double(Y);

A = Y-X;
B = X.*Y;
subplot(1,3,3);imshow(A);title('����');
MSE = sum(A(:).*A(:))/numel(Y);%  ���������MSE��numel()�������ؾ���Ԫ�ظ���  
SNR = 10*log10(sum(X(:).*X(:))/MSE/numel(Y));%�����SNR
PSNR = 10*log10(255^2/MSE);%      ��ֵ�����PSNR
SSIM = ssim(X,Y);
wsnr = WSNR(X,Y);

display(MSE);%���������MSE
display(SNR);%�����SNR
display(PSNR);%��ֵ�����PSNR
display(SSIM);%�ṹ������SSIM
display(wsnr);%��Ȩ�����WSNR



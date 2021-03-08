 function [mssim, ssim_map] = ssim(img1, img2, K, window, L)
 
 
if (nargin < 2 || nargin > 5) %��������С��2�����ߴ���5��,���˳�
mssim = -Inf;
ssim_map = -Inf;
return;
end
 
if (size(img1) ~= size(img2)) %�Աȵ�����ͼ��СҪһ�£������˳�
mssim = -Inf;
ssim_map = -Inf;
return;
end
 
[M, N] = size(img1); %��ͼ1�Ĵ�С��ֵ��M N
 
if (nargin == 2) %����Ϊ2ʱ
if ((M < 11) || (N < 11)) %ͼ�񳤿�����С��11�������˳�
mssim = -Inf;
ssim_map = -Inf;
return
end
window = fspecial('gaussian', 11, 1.5); %����Ԥ������˲����ӡ�
%Ϊ��˹��ͨ�˲���������������hsize��ʾģ��ߴ磬Ĭ��ֵΪ[3 3]��sigmaΪ�˲����ı�׼ֵ����λΪ���أ�Ĭ��ֵΪ0.5.
K(1) = 0.01;    % default settings
K(2) = 0.03;    %K L��������Ϊ���Ĭ��ֵ
L = 255; %����L��Ĭ��ֵ
end
 
if (nargin == 3) %����Ϊ3��ʱ����3������ΪK
if ((M < 11) || (N < 11))
mssim = -Inf;
ssim_map = -Inf;
return
end
window = fspecial('gaussian', 11, 1.5); %��ȡ�˲����ӣ�����Ϊgaussian��11Ϊ���ڳߴ磬1.5Ϊ��׼��
L = 255;
if (length(K) == 2) %����KΪ2��Ԫ�ص����飬�Ҷ�����0
if (K(1) < 0 || K(2) < 0)
mssim = -Inf;
ssim_map = -Inf;
return;
end
else
mssim = -Inf;
ssim_map = -Inf;
return;
end
end
 
if (nargin == 4) %����3ΪK������4Ϊ���ڴ�С
[H, W] = size(window); %window��������ones(8)
if ((H*W) < 4 || (H > M) || (W > N)) %���ڴ�СҪ�����4���߳���С��ͼ��ĳ���
mssim = -Inf;
ssim_map = -Inf;
return
end
L = 255;
if (length(K) == 2) %�ж�K����Ĵ�С
if (K(1) < 0 || K(2) < 0)
mssim = -Inf;
ssim_map = -Inf;
return;
end
else
mssim = -Inf;
ssim_map = -Inf;
return;
end
end
 
if (nargin == 5) %����3������������ʱ������L����ִ�д���Ĳ���
[H, W] = size(window);
if ((H*W) < 4 || (H > M) || (W > N))
mssim = -Inf;
ssim_map = -Inf;
return
end
if (length(K) == 2)
if (K(1) < 0 || K(2) < 0)
mssim = -Inf;
ssim_map = -Inf;
return;
end
else
mssim = -Inf;
ssim_map = -Inf;
return;
end
end
 
 
img1 = double(img1);
img2 = double(img2);
 
% automatic downsampling
f = max(1,round(min(M,N)/256)); %��ѡ�����������е���Сֵȡ������ѡ�����е����ֵ
%downsampling by f
%use a simple low-pass filter
if(f>1)
lpf = ones(f,f); %��ʼ��һ����λ�������ڹ�һ��
lpf = lpf/sum(lpf(:)); %��һ�������Ե�λ����ĸ���
img1 = imfilter(img1,lpf,'symmetric','same'); %ʹ���˲�������img1���д���lpf�ǹ�һ�����˲�ģ�壬
%�߽�ʹ��symmetric���������߽�
img2 = imfilter(img2,lpf,'symmetric','same');
%%% ��ֵ�˲�
img1 = img1(1:f:end,1:f:end); %���¸���ȡ��
img2 = img2(1:f:end,1:f:end);
end
 
C1 = (K(1)*L)^2; %��ȡ������C1��ֵ
C2 = (K(2)*L)^2; %��ȡ������C2��ֵ
window = window/sum(sum(window)); %�˲�����һ��������ȱʡ��sum(x)����������ӣ���ÿ�еĺͣ������������
 
mu1 = filter2(window, img1, 'valid'); %ʹ���趨�õĸ�˹��ͨ�˲���window��img1�����˲������������mu1��
%mu1�൱�������е�Ux,��ͼ��img1�ľ�ֵ
mu2 = filter2(window, img2, 'valid'); %mu2�൱�������е�Uy����ͼ��img2�ľ�ֵ�����ģ����ӣ���Ϊwindow��һ���ˣ������Ǿ�ֵ
mu1_sq = mu1.*mu1; %�������㣬�൱��img1��ֵ�ľ���˷�ƽ��
mu2_sq = mu2.*mu2;
mu1_mu2 = mu1.*mu2; %img1��img2��ֵ�ľ���˷�ƽ��
sigma1_sq = filter2(window, img1.*img1, 'valid') - mu1_sq; %Э����������ʽ��sigma_x=E��X^2��-��EX��^2
sigma2_sq = filter2(window, img2.*img2, 'valid') - mu2_sq; %Э����������ʽ��sigma_y=E��Y^2��-��EY��^2
sigma12 = filter2(window, img1.*img2, 'valid') - mu1_mu2; %Э����������ʽ��sigma_xy=E(XY��-��EX��*��EY��
 
if (C1 > 0 && C2 > 0)
ssim_map = ((2*mu1_mu2 + C1).*(2*sigma12 + C2))./((mu1_sq + mu2_sq + C1).*(sigma1_sq + sigma2_sq + C2));
else
numerator1 = 2*mu1_mu2 + C1;
numerator2 = 2*sigma12 + C2;
denominator1 = mu1_sq + mu2_sq + C1;
denominator2 = sigma1_sq + sigma2_sq + C2;
ssim_map = ones(size(mu1));
index = (denominator1.*denominator2 > 0);
ssim_map(index) = (numerator1(index).*numerator2(index))./(denominator1(index).*denominator2(index));
index = (denominator1 ~= 0) & (denominator2 == 0);
ssim_map(index) = numerator1(index)./denominator1(index);
end
 
mssim = mean2(ssim_map);
 
return
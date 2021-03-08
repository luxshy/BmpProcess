function f = WSNR(A,B)
a=size(A,3);%判断是否为彩色图像
    if a<2
        e = A - B;
        ew = filter2(csf, e);%csf滤波运算
        msew= sum(ew(:).*ew(:))/numel(B);%加权mse
	    decibels = 10*log10(sum(A(:).*A(:))/msew/numel(B));%snr计算公式
	    f=decibels;
    else 
        for i=1:3 %彩色图像分通道进行csf滤波
            s=0;
            A1=A(:,:,i);
            B1=B(:,:,i);
            e = A1 - B1;
            ew = filter2(csf, e);
            s=s+ew;
        end
        ew=s/3;
        msew= sum(ew(:).*ew(:))/numel(B);
	    decibels = 10*log10(sum(A(:).*A(:))/msew/numel(B));
        f=decibels;
 end


function fc = csf()
%=============
% Program to compute CSF
% Compute contrast sensitivity function of HVS
%
% Output:	fc	---	filter coefficients of CSF
%
% Reference:
%	Makoto Miyahara
%	"Objective Picture Quality Scale (PQS) for Image Coding"
%	IEEE Trans. on Comm., Vol 46, No.9, 1998.

	% compute frequency response matrix
	Fmat = csfmat;

	% Plot frequency response
	%mesh(Fmat); pause

	% compute 2-D filter coefficient using FSAMP2
	fc = fsamp2(Fmat);   
	%mesh(fc)

%===================
function Fmat = csfmat()
%===================
% Compute CSF frequency response matrix
%
% Called by function csf.m
%
% Frequency range: the rang of frequency seems to be:
% 	w = pi = (2*pi*f)/60
%	f = 60*w / (2*pi),	about 21.2
%
	min_f = -20;
	max_f = 20;
	step_f = 1;
	u = min_f:step_f:max_f; %生成从-20到20，以1为间距的等差数列
	v = min_f:step_f:max_f; %生成从-20到20，以1为间距的等差数列
	n = length(u);%计算u数列长度
	Z = zeros(n);%返回一个nxn的零矩阵
	for i=1:n
		for j=1:n 
			Z(i,j)=csffun(u(i),v(j));	% calling function csffun
		end
	end
	Fmat = Z;


%========================
function Sa = csffun(u,v)
%========================
% Contrast Sensitivity Function in spatial frequency
% This file compute the spatial frequency weighting of errors
%
% Reference:
%	Makoto Miyahara
%	"Objective Picture Quality Scale (PQS) for Image Coding"
%	IEEE Trans. on Comm., Vol 46, No.9, 1998.
%
% Input :  	u --- horizontal spatial frequencies
%		v --- vertical spatial frequencies
%		
% Output:	frequency response

	% Compute Sa -- spatial frequency response
	%syms S w sigma f u v
	sigma = 2;
	f = sqrt(u.*u+v.*v);
	w = 2*pi*f/60;
	Sw = 1.5*exp(-sigma^2*w^2/2)-exp(-2*sigma^2*w^2/2);

	% Modification in High frequency
	sita = atan(v./(u+eps));
	bita = 8;
	f0 = 11.13;
	w0 = 2*pi*f0/60;
	Ow = ( 1 + exp(bita*(w-w0)) * (cos(2*sita))^4) / (1+exp(bita*(w-w0)));

	% Compute final response
	Sa = Sw * Ow;
   

        
        

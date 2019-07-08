clc;
clear all;
close all;
tic;
L=16;
K=4;
K1=16;
K2=128;
K3=256;

Img = imread('liftingbody.png');
Img2D_rows = size(Img,1);
Img2D_cols = size(Img,2);

r1 = floor(rem(Img2D_rows,sqrt(L)));
r2 = floor(rem(Img2D_cols,sqrt(L)));
Img1 = zeros(Img2D_rows+r1,Img2D_cols+r2);
Img1(1:Img2D_rows,1:Img2D_cols) = Img;
if r1 ~= 0 
    Pad_rows = Img(end,:);
    for j = 1:r1
        Pad_rows(j,:) = Pad_rows(1,:);
    end
    Img1(1:Img2D_rows,1:Img2D_cols) = Img;
    Img1(Img2D_rows+1:end,1:Img2D_cols) = Pad_rows;
end
if r1 ~=0 && r2 ~= 0
    Pad_cols = Img1(:,Img2D_cols);
    for j=1:r2
        Pad_cols(:,j) = Pad_cols(:,1);
    end
    Img1(1:end,Img2D_cols+1:end) = Pad_cols;
elseif r2 ~= 0
    Pad_cols = Img(:,Img2d_cols);
    for j=1:sqrt(L)-r2
        Pad_cols(:,j) = Pad_cols(:,1);
    end
    Img1(1:Img2D_rows,1:Img2D_cols) = Img;
    Img1(1:Img2D_rows,Img2D_cols+1:end) = Pad_cols;
end

%K=4
I_re1 = Kmeans_Pre_Post(Img1,L,K);
I_re1 = uint8(I_re1);

fprintf('taxa de compressao: %.2f x %d', double(numel(Img))/double(K*L+numel(Img1)/L),1);
disp(' ');

SNR = 10*log10(std2(double(Img))^2/std2(double(Img)-double(I_re1))^2);
I_max = max(max(double(Img)));
I_min = min(min(double(Img)));
A = (I_max - I_min);
PSNR = 10*log10((A^2)/(std2(double(Img)-double(I_re1))^2));

fprintf('SNR = %.2f (dB)', SNR);
disp(' ');
fprintf('PSNR = %.2f (dB)', PSNR);
disp(' ');
toc;

%K=16
I_re2 = Kmeans_Pre_Post(Img1,L,K1);
I_re2 = uint8(I_re2);


fprintf('taxa de compressao: %.2f x %d', double(numel(Img))/double(K1*L+numel(Img1)/L),1);
disp(' ');

SNR = 10*log10(std2(double(Img))^2/std2(double(Img)-double(I_re2))^2);
I_max = max(max(double(Img)));
I_min = min(min(double(Img)));
A = (I_max - I_min);
PSNR = 10*log10((A^2)/(std2(double(Img)-double(I_re2))^2));

fprintf('SNR = %.2f (dB)', SNR);
disp(' ');
fprintf('PSNR = %.2f (dB)', PSNR);
disp(' ');
toc;

%K=128
I_re3 = Kmeans_Pre_Post(Img1,L,K2);
I_re3 = uint8(I_re3);

fprintf('taxa de compressao: %.2f x %d', double(numel(Img))/double(K2*L+numel(Img1)/L),1);
disp(' ');

SNR = 10*log10(std2(double(Img))^2/std2(double(Img)-double(I_re3))^2);
I_max = max(max(double(Img)));
I_min = min(min(double(Img)));
A = (I_max - I_min);
PSNR = 10*log10((A^2)/(std2(double(Img)-double(I_re3))^2));

fprintf('SNR = %.2f (dB)', SNR);
disp(' ');
fprintf('PSNR = %.2f (dB)', PSNR);
disp(' ');
toc;

%K=256
I_re4 = Kmeans_Pre_Post(Img1,L,K3);
I_re4 = uint8(I_re4);

fprintf('taxa de compressao: %.2f x %d', double(numel(Img))/double(K3*L+numel(Img1)/L),1);
disp(' ');

SNR = 10*log10(std2(double(Img))^2/std2(double(Img)-double(I_re4))^2);
I_max = max(max(double(Img)));
I_min = min(min(double(Img)));
A = (I_max - I_min);
PSNR = 10*log10((A^2)/(std2(double(Img)-double(I_re4))^2));

fprintf('SNR = %.2f (dB)', SNR);
disp(' ');
fprintf('PSNR = %.2f (dB)', PSNR);
disp(' ');

figure(1),imshow(Img) 
title('imagem de entrada'); 

figure(2)
subplot(2,2,1),imshow(I_re1) 
title('k = 4');
figure(2)
subplot(2,2,2),imshow(I_re2) 
title('k = 16');
figure(2)
subplot(2,2,3),imshow(I_re3) 
title('k = 128');
figure(2)
subplot(2,2,4),imshow(I_re3) 
title('k = 256');
clc;
clear all;
close all;
tic;
L=16;
K=256;
Img = imread('threads.png');
Img2D_rows = size(Img,1);
Img2D_cols = size(Img,2);
figure,imshow(Img);
title('imagem de entrada');
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
I_re = Kmeans_Pre_Post(Img1,L,K);
I_re = uint8(I_re);
figure,imshow(I_re);
title('imagem comprimida por quantizacao vetorial (kmeans)');
fprintf('tamanho da memoria da imagem de entrada = %d bytes', numel(Img));
disp(' ');
fprintf('tamanho da memoria da imagem de saida = %d bytes', K*L+numel(Img1)/L);
disp(' ');
fprintf('taxa de compressao (bits de entrada X bits de saida): %.2f x %d', double(numel(Img))/double(K*L+numel(Img1)/L),1);
disp(' ');
SNR = 10*log10(std2(double(Img))^2/std2(double(Img)-double(I_re))^2);
I_max = max(max(double(Img)));
I_min = min(min(double(Img)));
A = (I_max - I_min);
PSNR = 10*log10((A^2)/(std2(double(Img)-double(I_re))^2));
fprintf('SNR = %.2f (dB)', SNR);
disp(' ');
fprintf('PSNR = %.2f (dB)', PSNR);
disp(' ');
toc;
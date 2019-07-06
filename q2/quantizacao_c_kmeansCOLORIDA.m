clc;
clear all;
close all;
tic;

L=16;
K=256;

Img = imread('onion.png');
figure,imshow(Img);
title('imagem de entrada');

red = Img(:,:,1);
green = Img(:,:,2);
blue = Img(:,:,3);

R_linha = quantiKmeans(red);
G_linha = quantiKmeans(green);
B_linha = quantiKmeans(blue);
Ii_linha=cat(3,R_linha,G_linha,B_linha);


I_reR = Kmeans_Pre_Post(R_linha,L,K);
I_reG = Kmeans_Pre_Post(G_linha,L,K);
I_reB = Kmeans_Pre_Post(B_linha,L,K);

I_linha=cat(3,I_reR,I_reG,I_reB);

I_linha = uint8(I_linha);
figure,imshow(I_linha);
title('imagem comprimida por quantizacao vetorial');
fprintf('tamanho da memoria da imagem de entrada = %d bytes', numel(Img));
disp(' ');
fprintf('tamanho da memoria da imagem de saida = %d bytes', K*L+numel(I_linha)/L);
disp(' ');
fprintf('taxa de compressao : %.2f x %d', double(numel(Img))/double(K*L+numel(I_linha)/L),1);
disp(' ');

%R
SNRR = 10*log10(std2(double(R_linha))^2/std2(double(R_linha)-double(I_reR))^2);
I_max = max(max(double(R_linha)));
I_min = min(min(double(R_linha)));
A = (I_max - I_min);
PSNRR = 10*log10((A^2)/(std2(double(R_linha)-double(I_reR))^2));

%G
SNRG = 10*log10(std2(double(G_linha))^2/std2(double(G_linha)-double(I_reG))^2);
I_max = max(max(double(G_linha)));
I_min = min(min(double(G_linha)));
A = (I_max - I_min);
PSNRG = 10*log10((A^2)/(std2(double(G_linha)-double(I_reG))^2));


%B
SNRB = 10*log10(std2(double(Ii_linha))^2/std2(double(B_linha)-double(I_reB))^2);
I_max = max(max(double(G_linha)));
I_min = min(min(double(G_linha)));
A = (I_max - I_min);
PSNRB = 10*log10((A^2)/(std2(double(G_linha)-double(I_reB))^2));

vetPSNR = [PSNRR;PSNRG;PSNRB];
vetSNR = [SNRR;SNRG;SNRB];

psnrMean = mean(vetPSNR);
snrMean = mean(vetSNR);

fprintf('SNR = %.2f', snrMean);
disp(' ');
fprintf('PSNR = %.2f', psnrMean);
disp(' ');

toc;
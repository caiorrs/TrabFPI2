clc;
clear all;
close all;
tic;

L=16;
K=4;
K2=16;
K3=128;
K4=256;

Img = imread('strawberries.jpg');


red = Img(:,:,1);
green = Img(:,:,2);
blue = Img(:,:,3);

R_linha = quantiKmeans(red);
G_linha = quantiKmeans(green);
B_linha = quantiKmeans(blue);
Ii_linha=cat(3,R_linha,G_linha,B_linha);

%K=4
I_reR1 = Kmeans_Pre_Post(R_linha,L,K);
I_reG1 = Kmeans_Pre_Post(G_linha,L,K);
I_reB1 = Kmeans_Pre_Post(B_linha,L,K);
I_linha1=cat(3,I_reR1,I_reG1,I_reB1);

I_linha1 = uint8(I_linha1);
fprintf('taxa de compressao : %.2f x %d', double(numel(Img))/double(K*L+numel(I_linha1)/L),1);
disp(' ');

%R
SNRR = 10*log10(std2(double(R_linha))^2/std2(double(R_linha)-double(I_reR1))^2);
I_max = max(max(double(R_linha)));
I_min = min(min(double(R_linha)));
A = (I_max - I_min);
PSNRR = 10*log10((A^2)/(std2(double(R_linha)-double(I_reR1))^2));

%G
SNRG = 10*log10(std2(double(G_linha))^2/std2(double(G_linha)-double(I_reG1))^2);
I_max = max(max(double(G_linha)));
I_min = min(min(double(G_linha)));
A = (I_max - I_min);
PSNRG = 10*log10((A^2)/(std2(double(G_linha)-double(I_reG1))^2));


%B
SNRB = 10*log10(std2(double(B_linha))^2/std2(double(B_linha)-double(I_reB1))^2);
I_max = max(max(double(B_linha)));
I_min = min(min(double(B_linha)));
A = (I_max - I_min);
PSNRB = 10*log10((A^2)/(std2(double(B_linha)-double(I_reB1))^2));

vetPSNR = [PSNRR;PSNRG;PSNRB];
vetSNR = [SNRR;SNRG;SNRB];

psnrMean = mean(vetPSNR);
snrMean = mean(vetSNR);

fprintf('SNR = %.2f', snrMean);
disp(' ');
fprintf('PSNR = %.2f', psnrMean);
disp(' ');
toc;

%K=16
I_reR2 = Kmeans_Pre_Post(R_linha,L,K2);
I_reG2 = Kmeans_Pre_Post(G_linha,L,K2);
I_reB2 = Kmeans_Pre_Post(B_linha,L,K2);

I_linha2=cat(3,I_reR2,I_reG2,I_reB2);

I_linha2 = uint8(I_linha2);
fprintf('taxa de compressao : %.2f x %d', double(numel(Img))/double(K2*L+numel(I_linha2)/L),1);
disp(' ');

%R
SNRR = 10*log10(std2(double(R_linha))^2/std2(double(R_linha)-double(I_reR2))^2);
I_max = max(max(double(R_linha)));
I_min = min(min(double(R_linha)));
A = (I_max - I_min);
PSNRR = 10*log10((A^2)/(std2(double(R_linha)-double(I_reR2))^2));

%G
SNRG = 10*log10(std2(double(G_linha))^2/std2(double(G_linha)-double(I_reG2))^2);
I_max = max(max(double(G_linha)));
I_min = min(min(double(G_linha)));
A = (I_max - I_min);
PSNRG = 10*log10((A^2)/(std2(double(G_linha)-double(I_reG2))^2));


%B
SNRB = 10*log10(std2(double(B_linha))^2/std2(double(B_linha)-double(I_reB2))^2);
I_max = max(max(double(B_linha)));
I_min = min(min(double(B_linha)));
A = (I_max - I_min);
PSNRB = 10*log10((A^2)/(std2(double(B_linha)-double(I_reB2))^2));

vetPSNR = [PSNRR;PSNRG;PSNRB];
vetSNR = [SNRR;SNRG;SNRB];

psnrMean = mean(vetPSNR);
snrMean = mean(vetSNR);

fprintf('SNR = %.2f', snrMean);
disp(' ');
fprintf('PSNR = %.2f', psnrMean);
disp(' ');
toc;

%K=128
I_reR2 = Kmeans_Pre_Post(R_linha,L,K3);
I_reG2 = Kmeans_Pre_Post(G_linha,L,K3);
I_reB2 = Kmeans_Pre_Post(B_linha,L,K3);

I_linha3=cat(3,I_reR2,I_reG2,I_reB2);

I_linha3 = uint8(I_linha3);
fprintf('taxa de compressao : %.2f x %d', double(numel(Img))/double(K3*L+numel(I_linha3)/L),1);
disp(' ');

%R
SNRR = 10*log10(std2(double(R_linha))^2/std2(double(R_linha)-double(I_reR2))^2);
I_max = max(max(double(R_linha)));
I_min = min(min(double(R_linha)));
A = (I_max - I_min);
PSNRR = 10*log10((A^2)/(std2(double(R_linha)-double(I_reR2))^2));

%G
SNRG = 10*log10(std2(double(G_linha))^2/std2(double(G_linha)-double(I_reG2))^2);
I_max = max(max(double(G_linha)));
I_min = min(min(double(G_linha)));
A = (I_max - I_min);
PSNRG = 10*log10((A^2)/(std2(double(G_linha)-double(I_reG2))^2));


%B
SNRB = 10*log10(std2(double(B_linha))^2/std2(double(B_linha)-double(I_reB2))^2);
I_max = max(max(double(B_linha)));
I_min = min(min(double(B_linha)));
A = (I_max - I_min);
PSNRB = 10*log10((A^2)/(std2(double(B_linha)-double(I_reB2))^2));

vetPSNR = [PSNRR;PSNRG;PSNRB];
vetSNR = [SNRR;SNRG;SNRB];

psnrMean = mean(vetPSNR);
snrMean = mean(vetSNR);

fprintf('SNR = %.2f', snrMean);
disp(' ');
fprintf('PSNR = %.2f', psnrMean);
disp(' ');
toc;

%K=256
I_reR3 = Kmeans_Pre_Post(R_linha,L,K4);
I_reG3 = Kmeans_Pre_Post(G_linha,L,K4);
I_reB3 = Kmeans_Pre_Post(B_linha,L,K4);

I_linha4=cat(3,I_reR3,I_reG3,I_reB3);

I_linha4 = uint8(I_linha4);
fprintf('taxa de compressao : %.2f x %d', double(numel(Img))/double(K4*L+numel(I_linha4)/L),1);
disp(' ');

%R
SNRR = 10*log10(std2(double(R_linha))^2/std2(double(R_linha)-double(I_reR3))^2);
I_max = max(max(double(R_linha)));
I_min = min(min(double(R_linha)));
A = (I_max - I_min);
PSNRR = 10*log10((A^2)/(std2(double(R_linha)-double(I_reR3))^2));

%G
SNRG = 10*log10(std2(double(G_linha))^2/std2(double(G_linha)-double(I_reG3))^2);
I_max = max(max(double(G_linha)));
I_min = min(min(double(G_linha)));
A = (I_max - I_min);
PSNRG = 10*log10((A^2)/(std2(double(G_linha)-double(I_reG3))^2));


%B
SNRB = 10*log10(std2(double(B_linha))^2/std2(double(B_linha)-double(I_reB3))^2);
I_max = max(max(double(B_linha)));
I_min = min(min(double(B_linha)));
A = (I_max - I_min);
PSNRB = 10*log10((A^2)/(std2(double(B_linha)-double(I_reB3))^2));

vetPSNR = [PSNRR;PSNRG;PSNRB];
vetSNR = [SNRR;SNRG;SNRB];

psnrMean = mean(vetPSNR);
snrMean = mean(vetSNR);

fprintf('SNR = %.2f', snrMean);
disp(' ');
fprintf('PSNR = %.2f', psnrMean);
disp(' ');
toc;

figure(1),imshow(Img) 
title('imagem de entrada'); 

figure(2)
subplot(2,2,1),imshow(I_linha1) 
title('k = 4');
figure(2)
subplot(2,2,2),imshow(I_linha2) 
title('k = 16');
figure(2)
subplot(2,2,3),imshow(I_linha3) 
title('k = 128');
figure(2)
subplot(2,2,4),imshow(I_linha4) 
title('k = 256');
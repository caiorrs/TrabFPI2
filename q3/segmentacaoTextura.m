
%imagem
Im = imread('cap.jpg');
I = rgb2gray(Im);
figure,imshow(Im);
%textura
E = entropyfilt(I);
Eim = mat2gray(E);
figure,imshow(Eim);
%mascara textura bottom
BW1 = imbinarize(Eim, 1);
%figure,imshow(BW1);
%extracao textura
BWao = bwareaopen(BW1,2000);
%figure,imshow(BWao);
%suavizacao textura
nhood = true(9);
closeBWao = imclose(BWao,nhood);
%figure,imshow(closeBWao);
%preencher buracos
roughMask = imfill(closeBWao,'holes');
%figure,imshow(roughMask);
%raw img topo
I2 = I;
I2(roughMask) = 0;
%figure,imshow(I2);
%calculo textura topo
E2 = entropyfilt(I2);
E2im = mat2gray(E2);
%figure,imshow(E2im);
%threshold
BW2 = imbinarize(E2im);
%figure,imshow(BW2);
%mascara topo
mask2 = bwareaopen(BW2,1000);
%figure,imshow(mask2);
%extracao texturas
texture1 = I;
texture1(~mask2) = 0;
texture2 = I;
texture2(mask2) = 0;
%figure,imshow(texture1);
%figure, imshow(texture2);
%fronteira entre texturas
boundary = bwperim(mask2);
segmentResults = I;
segmentResults(boundary) = 255;
figure,imshow(segmentResults);



figure,imshow(Im-texture2);
figure,imshow(Im-texture1);





%imagem
Im = imread('kobi.png');
I = rgb2gray(Im);
figure,imshow(Im);
%textura
E = entropyfilt(I);
Eim = mat2gray(E);
figure,imshow(Eim);
%mascara textura bottom
BW1 = imbinarize(Eim, .69999);
%figure,imshow(BW1);
%extracao textura
BWao = bwareaopen(BW1,20000);
%figure,imshow(BWao);
%suavizacao textura
nhood = true(9);
closeBWao = imclose(BWao,nhood);
%figure,imshow(closeBWao);
%preencher buracos
roughMask = imfill(closeBWao,'holes');
%figure,imshow(roughMask);
%raw img topo
I2 = I;
I2(roughMask) = 0;
%figure,imshow(I2);
%calculo textura topo
E2 = entropyfilt(I2);
E2im = mat2gray(E2);
%figure,imshow(E2im);
%threshold
BW2 = imbinarize(E2im);
%figure,imshow(BW2);
%mascara topo
mask2 = bwareaopen(BW2,20000);
%figure,imshow(mask2);
%extracao texturas
texture1 = I;
texture1(~mask2) = 0;
texture2 = I;
texture2(mask2) = 0;
%figure,imshow(texture1);
%figure, imshow(texture2);
%fronteira entre texturas
boundary = bwperim(mask2);
segmentResults = I;
segmentResults(boundary) = 255;
figure,imshow(segmentResults);

figure,imshow(Im-texture2);
figure,imshow(Im-texture1);
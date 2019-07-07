he = uint8(imread('kobi.png'));
figure,imshow(he);
cform = makecform('srgb2lab');
lab_he = applycform(he,cform);
ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
nColors = 3;
[cluster_idx,cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean','Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);
figure,imshow(pixel_labels,[]),title('imagem rotulada pelo indice do agrupamento');
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);
for k=1:nColors
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
    txt = ['objetos no agrupamento ', num2str(k)];
    figure,imshow(segmented_images{k}),title(txt);
end

he = imread('cap.jpg');
figure,imshow(he),title('imagem de patologia');
cform = makecform('srgb2lab');
lab_he = applycform(he,cform);
ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
nColors = 2;
[cluster_idx,cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean','Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);
figure,imshow(pixel_labels,[]),title('imagem rotulada pelo indice do agrupamento');
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);
for k=1:nColors
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
    txt = ['objetos no agrupamento ', num2str(k)];
    figure,imshow(segmented_images{k}),title(txt);
end
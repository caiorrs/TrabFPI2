function[Img1]=quantiKmeans(Img)


L=16;

Img2D_rows = size(Img,1);
Img2D_cols = size(Img,2);


r1 = floor(rem(Img2D_rows,sqrt(L)));
r2 = floor(rem(Img2D_cols,sqrt(L)));
Img1 = zeros(Img2D_rows+r1,Img2D_cols+r2);

Img1(1:Img2D_rows,1:Img2D_cols) = Img;
if r1~= 0 
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



end
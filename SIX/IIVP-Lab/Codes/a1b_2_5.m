f = imread('lenna.jpg');

I = mat2gray(f);


I(I < 50) = 0;
I(I > 50) = 1;

imshow(mat2gray(I));
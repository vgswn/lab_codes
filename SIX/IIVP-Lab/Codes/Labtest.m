I = imread('cameraman.tif')
[m,n] = size(I)
I1 = I(m/4:3*m/4, n/4:3*n/4, 1);
imshow(I1);

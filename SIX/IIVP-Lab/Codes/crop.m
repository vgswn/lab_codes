I = imread('cameraman.tif')

[m, n] = size(I);

R = I(m/4:3*m/4, n/4:3*n/4, 1);

subplot(1, 2, 1), subimage(I);
subplot(1, 2, 2), subimage(R);
%imshow(R);
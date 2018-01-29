f = imread('lenna.jpg');
%imshow(f);

[m, n] = size(f);

R = f(m/2-100:m/2+100, n/2-100:n/2+100);

R1 = mat2gray(R);
imshow(R1);
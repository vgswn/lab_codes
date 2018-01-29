A = imread('cameraman.tif');
%imshow(A);

%i2 = flipdim(A, 2);
%imshow(i2);

[m, n] = size(A);

for i = 1:m
    for j = 1:n
       A1(m-i+1, j) = A(i, j); 
    end
end


subplot(1, 2, 1), subimage(A);
title('Original Image');
A2 = mat2gray(A1);

subplot(1, 2, 2), subimage(A2);
title('Flipped Image');
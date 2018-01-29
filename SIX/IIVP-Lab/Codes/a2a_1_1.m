I = imread('cameraman.tif');

[m, n] = size(I);

for i = 1:m
    for j = 1:n
       A1(m-j+1, i) = I(i, j); 
    end
end


subplot(1, 2, 1), subimage(A);
title('Original Image');

A2 = mat2gray(A1);
subplot(1, 2, 2), subimage(A2);
title('Rotated Image');
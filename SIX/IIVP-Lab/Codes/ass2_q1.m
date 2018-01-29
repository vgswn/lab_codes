I = imread('cameraman.tif');
[m,n] = size(I);
for i = 1:m
    for j = 1:n
        C1(n-j+1,i) = I(i,j);
    end
end
c = mat2gray(C1);
subplot(1, 2, 1), subimage(I);
title('Original');
subplot(1, 2, 2), subimage(c);
title('Rotated');

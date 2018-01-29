I = imread('cameraman.tif');

subplot(5, 2, 1), subimage(I);
title('Original Image');
subplot(5, 2, 2), imhist(I);
title('Line Graph Histogram');

for i = 1:m
    for j = 1:n
        R1(i, j) = nthroot(I(i, j), 0.8);
    end
end
R1 = nthroot(I, 0.8);

subplot(5, 2, 3), subimage(R1);
subplot(5, 2, 4), imhist(R1);

R2 = nthroot(I, 0.9);
subplot(5, 2, 5), subimage(R2);
subplot(5, 2, 6), imhist(R2);

R3 = nthroot(I, 1.1);
subplot(5, 2, 7), subimage(R3);
subplot(5, 2, 8), imhist(R3);

R4 = nthroot(I, 1.2);
subplot(5, 2, 9), subimage(R4);
subplot(5, 2, 10), imhist(R4);


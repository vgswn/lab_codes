I = imread('cameraman.tif');

subplot(4, 2, 1), subimage(I);
title('Original Image');
subplot(4, 2, 2), imhist(I);
title('Line Graph Histogram');

%I1 = rgb2gray(I);
c = 1;
for i = 1:m
    for j = 1:n
       z = double(I(i, j));
       R1(i, j) = c.*log10(1 + z);
    end
end

subplot(4, 2, 3), subimage(R1);
subplot(4, 2, 4), imhist(R1);

c = 2;
for i = 1:m
    for j = 1:n
       z = double(I(i, j));
       R2(i, j) = c.*log10(1 + z);
    end
end

subplot(4, 2, 5), subimage(R2);
subplot(4, 2, 6), imhist(R2);

c = 3;
for i = 1:m
    for j = 1:n
       z = double(I(i, j));
       R3(i, j) = c.*log10(1 + z);
    end
end

subplot(4, 2, 7), subimage(R3);
subplot(4, 2, 8), imhist(R3);

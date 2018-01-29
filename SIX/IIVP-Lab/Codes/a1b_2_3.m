I = imread('lenna.jpg')

[m, n] = size(I);

R = I(100:150, 190:230, :);
        

subplot(1, 2, 1), subimage(I);
title('Original Image');
subplot(1, 2, 2), subimage(mat2gray(R));
title('Cropped Image');
%imshow(R);
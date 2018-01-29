I = imread('cameraman.tif')

[m, n] = size(I);

n1 = input('n1 = ');
n2 = input('n2 = ');

%R = I(m/4:3*m/4, n/4:3*n/4, 1);

for i = n1:(n1+n1)
    for j = n2:(n2+n2)
        R(i, j) = I(i, j);
    end
end
        

subplot(1, 2, 1), subimage(I);
title('Original Image');
subplot(1, 2, 2), subimage(R);
title('Cropped Image');
%imshow(R);
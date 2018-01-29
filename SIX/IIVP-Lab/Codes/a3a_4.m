A = imread('building.jpg');

subplot(1,2, 1), imshow(A);
title('Original Image');

B = rgb2gray(A);
C = double(B);

for i = 1:size(C,1)-2
    for j = 1:size(C,2)-2
        
        B(i, j) = (C(i+1, j)+C(i+2, j+1) + C(i, j+1)+C(i+1, j+2)) - (4*C(i+1, j+1));
      
    end
end
Thresh = 50;
B = max(B,Thresh);
B(B == round(Thresh)) = 0;

B = uint8(B);
subplot(1,2, 2), imshow(B);
title('Lapalacian Operator');
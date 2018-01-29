I = imread('boy.png');
%myfilter = fspecial('gaussian',[3 3], 0.5);
%A = imfilter(I, myfilter, 'replicate');
A = I;

subplot(1,2, 1), imshow(A);
title('Image');
%title('Smoothed Image');

B = rgb2gray(A);
C = double(B);

for i = 1:size(C,1)-2
    for j = 1:size(C,2)-2
        
        Gx =((C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(C(i,j+1)+C(i,j)+C(i,j+2)));
        Gy =((C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(C(i+1,j)+C(i,j)+C(i+2,j)));
        
        B(i,j) = sqrt(Gx.^2+Gy.^2);
      
    end
end
Thresh = 225;
B = max(B,Thresh);
B(B == round(Thresh)) = 0;

B = uint8(B);
subplot(1,2, 2), imshow(B);
title('Prewitt Operator');
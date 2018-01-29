I = imread('building.jpg');
myfilter = fspecial('gaussian',[3 3], 0.5);
A = imfilter(I, myfilter, 'replicate');
%A = I;
subplot(2,3, 1), imshow(A);
title('Smoothed Image');

B = rgb2gray(A);
C = double(B);

for i = 1:size(C,1)-1
    for j = 1:size(C,2)-1
        
        Gx =((C(i,j+1))-(C(i,j)));
        Gy =((C(i+1,j))-(C(i,j)));
        
        B(i,j) = sqrt(Gx.^2+Gy.^2);
      
    end
end

Thresh = 32;
B = max(B,Thresh);
B(B == round(Thresh)) = 0;

B = uint8(B);
subplot(2,3,2), imshow(B);
title('Simple Gradient Operator');

for i = 1:size(C,1)-1
    for j = 1:size(C,2)-1
        
        Gx =((C(i+1,j)+ C(i+1,j+1))-(C(i,j) + C(i,j+1)));
        Gy =((C(i+1,j+1)+ C(i,j+1))-(C(i,j)+ C(i+1,j)));
        
        B(i,j) = sqrt(Gx.^2+Gy.^2);
      
    end
end

Thresh = 64;
B = max(B,Thresh);
B(B == round(Thresh)) = 0;

B = uint8(B);
subplot(2,3,3), imshow(B);
title('Gradient Using 2X2 mask Operator');

for i = 1:size(C,1)-1
    for j = 1:size(C,2)-1
        
        Gx =((C(i+1,j+1))-(C(i,j)));
        Gy =((C(i+1,j))-(C(i,j+1)));
        
        B(i,j) = sqrt(Gx.^2+Gy.^2);
      
    end
end

Thresh = 64;
B = max(B,Thresh);
B(B == round(Thresh)) = 0;

B = uint8(B);
subplot(2,3, 4), imshow(B);
title('Roberts Operator');

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
subplot(2,3, 5), imshow(B);
title('Prewitt Operator');

for i = 1:size(C,1)-2
    for j = 1:size(C,2)-2
        
        Gx =((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
        Gy =((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
        
        B(i,j) = sqrt(Gx.^2+Gy.^2);
      
    end
end

Thresh = 225;
B = max(B,Thresh);
B(B == round(Thresh)) = 0;

B = uint8(B);
subplot(2,3, 6), imshow(B);
title('Sobel Operator');
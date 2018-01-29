A = imread('peppers.png');


subplot(2,2, 1), imshow(A);
title('Original Image');

%B=rgb2gray(A);
B = A(:, :, 1);
C = double(B);


for i = 1:size(C,1)-2
    for j = 1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx =((C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy =((C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(C(i+1,j)+C(i,j)+C(i+2,j)));
      
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        B(i,j) = sqrt(Gx.^2+Gy.^2);
      
    end
end

subplot(2,2, 2), imshow(B);
title('Channel Red');


B = A(:, :, 2);
C = double(B);

for i = 1:size(C,1)-2
    for j = 1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx =((C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy =((C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(C(i+1,j)+C(i,j)+C(i+2,j)));
      
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        B(i,j) = sqrt(Gx.^2+Gy.^2);
      
    end
end

subplot(2,2, 3), imshow(B);
title('Channel Green');


B = A(:, :, 3);
C = double(B);

for i = 1:size(C,1)-2
    for j = 1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx =((C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy =((C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(C(i+1,j)+C(i,j)+C(i+2,j)));
      
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        B(i,j) = sqrt(Gx.^2+Gy.^2);
      
    end
end


subplot(2, 2, 4), imshow(B);
title('Channel Blue');

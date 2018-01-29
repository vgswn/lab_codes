I = imread('cameraman.tif');

rows = 256;
cols = 256;
radius = 50;
center = [128 128];  % In [X,Y] coordinates
% Make the circle
[xMat,yMat] = meshgrid(1:cols,1:rows);
distFromCenter = sqrt((xMat-center(1)).^2 + (yMat-center(2)).^2);
circleMat = distFromCenter<=radius;
figure, imshow(circleMat)

%B = circleMat & ~bwmorph(circleMat,'erode',1);
%figure, imshow(B)

[m, n] = size(I);

%circleMat(circleMat = 1) = 

for i = 1:m
    for j = 1:n
        if (circleMat(i, j) > 0) 
            I1(i, j) = I(i, j);
        else
            I1(i, j) = 0;
        end   
    end
end

I2 = mat2gray(I1);
imshow(I2);
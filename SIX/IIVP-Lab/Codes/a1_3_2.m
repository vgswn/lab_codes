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
I = imread('cameraman.tif')
[j,k] = size(I)
for i = 1:m
    for j = 1:n
        I1(i,n-j+1) = I(i,j);
    end
end
subplot(1,2,1),subimage(I);
subplot(1,2,2),subimage(I1);
%imshow(I1)
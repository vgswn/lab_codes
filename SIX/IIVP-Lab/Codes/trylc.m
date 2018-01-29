originalI = imread('cameraman.tif');
se = strel('ball',5,5);
erodedI = imerode(originalI,se);
dilatedI = imdilate(originalI,se);
subplot(2,2,1), imshow(originalI);
subplot(2,2,2), imshow(erodedI);
subplot(2,2,3), imshow(originalI);
subplot(2,2,4), imshow(dilatedI);
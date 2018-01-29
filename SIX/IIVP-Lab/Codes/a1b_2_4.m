A = imread('lenna.jpg');
B = imread('cameraman.tif');

C = imfuse(A,B,'blend','Scaling','joint');
imshow(C);
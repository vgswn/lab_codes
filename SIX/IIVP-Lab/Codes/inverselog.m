I = imread('cameraman.tif');
I3=im2double(I);
c=4;
J2 = (exp(I3).^ (1/c))-1;
imshow(J2);

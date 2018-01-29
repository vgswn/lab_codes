a=imread('cameraman.tif');

L = input('Enter the value of L: ');
c = L/log10(1+L);
d = c*log10(1+double(a));

F = [a uint8(d)];
imshow(F)
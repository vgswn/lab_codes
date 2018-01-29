f = imread('cameraman.tif');
z = input('Enter the size of the filter= ');
w = ones(z)/(z*z);
g1 = imfilter(f, w, 'circular');
imshow(g1);
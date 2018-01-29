I = imread('cameraman.tif');

%gets the bit at that position
for i = 1:8
    I(i) = bitget(I, i);
end

for i = 1:8
    I(i) = mat2gray(I(i));
end

imshow([I(1) I(2) I(3) I(4) I(5) I(6) I(7) I(8)]);
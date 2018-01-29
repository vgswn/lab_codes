a = randi([0, 255], 512, 512);
b = mat2gray(a);


[m, n] = size(b);
%R = I(m/4:3*m/4, n/4:3*n/4, 1);
R = b(m/2-150:m/2+150, n/2-150:n/2+150);

R1 = mat2gray(R);
imshow(R1);



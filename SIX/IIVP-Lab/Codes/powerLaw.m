A = imread('football.jpg');
A = im2double(A);
[r, c] = size(A);
gamma = 0.6;
C = 1;
for i = 1:r
    for j = 1:c
        S(i,j) = C*(A(i,j)^gamma);
    end
end
imshow(S)

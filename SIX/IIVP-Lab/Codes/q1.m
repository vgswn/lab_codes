I = imread('cameraman.tif');
%imshow(I);

[m, n] = size(I);

for i = 1:m
    for j = 1:n
        if ( I(i, j) < 30)
            I(i, j) = 0;
        end   
        if (I(i, j) > 180)
             I(i, j) = 255;
        end   
    end
end

%I(I < 30) = 0;
%I(I > 180) = 255;

A1 = mat2gray(I);
imshow(A1);

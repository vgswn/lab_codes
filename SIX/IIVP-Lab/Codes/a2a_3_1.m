I = imread('cameraman.tif');


R = zeros(m);
for i = 1:m
    for j = 1:n
        R(I(i, j)) = R(I(i, j))+1;
    end
end

subplot(2, 2, 1), subimage(I);
title('Original Image');

subplot(2, 2, 2), bar(R);
title('Line Graph Histogram');

R1 = 256-I;

R = zeros(m);
for i = 1:m
    for j = 1:n
        R(R1(i, j)) = R(R1(i, j))+1;
    end
end


subplot(2, 2, 3), subimage(R1);
title('Negative Image');

subplot(2, 2, 4), bar(R);
title('Line Graph Histogram');





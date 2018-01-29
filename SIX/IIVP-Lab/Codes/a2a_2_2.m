I = imread('cameraman.tif');

[m, n] = size(I);

R = zeros(m);
for i = 1:m
    for j = 1:n
        R(I(i, j)) = R(I(i, j))+1;
    end
end    

subplot(2, 2, 1), plot(R);
title('Line Graph Histogram');

subplot(2, 2, 2), bar(R);
title('Bar Graph Histogram');

R2 = R/(m*n);
subplot(2, 2, 3), bar(R2);
title('Normalized Histogram');

subplot(2, 2, 4), imhist(I);
title('Histogram using imhist()');
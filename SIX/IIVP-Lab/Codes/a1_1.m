for i = 1:16
    for j = 1:16
        A(i, j) = 255 - (j*10)
    end
end

A1 = mat2gray(A);
subplot(1, 3, 1), subimage(A1);
title('A');
%imshow(A1);

a = [0 9; 9 0];
b = [a a; a a];
c = [b b; b b];
B = [c c; c c];
B1 = mat2gray(B);
subplot(1, 3, 2), subimage(B1);
title('B');
%imshow(B1);

C = [A B; B A];
C1 = mat2gray(C);
subplot(1, 3, 3), subimage(C1);
title('C');
%imshow(C1);
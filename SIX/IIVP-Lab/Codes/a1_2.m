I = imread('cameraman.tif');

for i = 1:127
    for j = 1:127
        C1(i, j) = I(i, j);
    end
end

for i = 1:127
    for j = 128:256
        C2(i, j) = I(i, j);
    end
end

for i = 127:256
    for j = 1:127
        C3(i, j) = I(i, j);
    end
end

for i = 127:256
    for j = 127:256
        C4(i, j) = I(i, j);
    end
end

subplot(2, 2, 1), subimage(C1);
subplot(2, 2, 2), subimage(C2);
subplot(2, 2, 3), subimage(C3);
subplot(2, 2, 4), subimage(C4);


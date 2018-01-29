I = imread('cameraman.tif');

C1 = I(1:127,1:127);
C2 = I(1:127,128:256);
C3 = I(127:256,1:127);
C4 = I(127:256,127:256);

subplot(2, 2, 1), subimage(C4);
title('C22');
subplot(2, 2, 2), subimage(C3);
title('C21');
subplot(2, 2, 3), subimage(C2);
title('C12');
subplot(2, 2, 4), subimage(C1);
title('C11');
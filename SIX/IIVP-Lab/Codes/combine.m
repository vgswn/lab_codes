img = imread('cameraman.tif');
img = double(img);
bp0 = mod(img,2);
bp1 = mod(floor(img/2),2);
bp2 = mod(floor(img/4),2);
bp3 = mod(floor(img/8),2);
bp4 = mod(floor(img/16),2);
bp5 = mod(floor(img/32),2);
bp6 = mod(floor(img/64),2);
bp7 = mod(floor(img/128),2);

bp_all = 2*(2*(2*(2*(2*(2*(2*bp7+bp6)+bp5)+bp4)+bp3)+bp2)+bp1)+bp0;

subplot(241);imshow(bp0);title('bit-plane 0 : LSB');
subplot(242);imshow(bp1);title('bit-plane 1');
subplot(243);imshow(bp2);title('bit-plane 2');
subplot(244);imshow(bp3);title('bit-plane 3');
subplot(245);imshow(bp4);title('bit-plane 4');
subplot(246);imshow(bp5);title('bit-plane 5');
subplot(247);imshow(bp6);title('bit-plane 6');
subplot(248);imshow(bp7);title('bit-plane 7 : MSB');

figure, imshow(uint8(bp_all));
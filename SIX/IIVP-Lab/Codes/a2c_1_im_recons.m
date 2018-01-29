A=imread('boy.png');
B=zeros(size(A));
B=bitset(B,8,bitget(A,8));
B=bitset(B,7,bitget(A,7));
B=bitset(B,6,bitget(A,6));
%B=bitset(B,5,bitget(A,5));
B=uint8(B);
figure,imshow(B);
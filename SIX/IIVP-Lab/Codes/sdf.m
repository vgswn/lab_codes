
A=imread('coins.png');
figure,imshow(A);
%F1=[0 1 0;1 -4 1; 0 1 0];
I1=A;
I=zeros(size(A));
X=zeros(size(A));
B=zeros(size(A));
n = 3;

F1=[-1 0 1;-1 0 1; -1 0 1];
F2=[-1 -1 -1; 0 0 0; 1 1 1];

A=padarray(A,[(n-1)/2,(n-1)/2]);
A=double(A);

for i=1:size(A,1)-(n-1)
    for j=1:size(A,2)-(n-1)
       
        I(i,j)=sum(sum(F1.*A(i:i+2,j:j+2)));
        X(i,j)=sum(sum(F2.*A(i:i+2,j:j+2)));
        B(i,j) = sqrt(I(i,j).^2 + X(i,j).^2);
    end
end

B=uint8(B);
figure,imshow(B);title('Filtered Image');
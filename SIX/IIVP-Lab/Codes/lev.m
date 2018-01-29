clear;
clc;
A=imread('coins.png');
figure,imshow(A);

I1=A;
I=zeros(size(A));
%n=input('Size of filter: ');
%for i=1:n
 %   for j=1:n
       
  %      F1(i,j)=input('Value of filter: ');
       
   % end
%end
F1=[0 1 0;1 -4 1; 0 1 0];

A=padarray(A,[(n-1)/2,(n-1)/2]);
A=double(A);

for i=1:size(A,1)-(n-1)
    for j=1:size(A,2)-(n-1)
       
        I(i,j)=sum(sum(F1.*A(i:i+(n-1),j:j+(n-1))));
       
    end
end

I=uint8(I);
figure,imshow(I);title('Filtered Image');
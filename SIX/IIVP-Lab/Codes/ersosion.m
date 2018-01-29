A=imread('cameraman.tif');
A=im2bw(A);
%Structuring element
B=getnhood(strel('line',7,90));
m=floor(size(B2,1)/2);
n=floor(size(B2,2)/2);
%Pad array on all the sides
C=padarray(A,[m n]);
D=false(size(A));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
       
        Temp=C(i:i+(2*m),j:j+(2*n));
       
        D(i,j)=min(min(Temp&B));
      
    end
end
figure,imshow(D);
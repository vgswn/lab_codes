clear all;
close all;
clc;
a=imread('cameraman.tif');
b1=[];
b2=[];
b3=[];
b4=[];

b5=[];
b6=[];

b7=[];
b8=[];

for m=1:256
    for n=1:256
        t=de2bi(a(m,n),8,'left-msb');
        b1(m,n)=t(1,1);
        b2(m,n)=t(1,2);
        b3(m,n)=t(1,3);
        b4(m,n)=t(1,4);
        b5(m,n)=t(1,5);
        b6(m,n)=t(1,6);
        b7(m,n)=t(1,7);
        b8(m,n)=t(1,8);
    end
end
       
subplot(3,3,1);
imshow(a);
title('image of cameramen','color','r'); 

subplot(3,3,2);
imshow(b8);
title('image of bit-1','color','r'); 
subplot(3,3,3);
imshow(b7);
title('image of bit-2','color','r'); 
subplot(3,3,4);
imshow(b6);
title('image of bit-3','color','r'); 
subplot(3,3,5);
imshow(b5);
title('image of bit-4','color','r'); 
subplot(3,3,6);
imshow(b4);
title('image of bit-5','color','r'); 

subplot(3,3,7);
imshow(b3);
title('image of bit-6','color','r'); 

subplot(3,3,8);
imshow(b2);
title('image of bit-7','color','r'); 

subplot(3,3,9);
imshow(b1);
title('image of bit-8','color','r'); 

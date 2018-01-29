clc; clear all; close all;
f=imread('cameraman.tif');
g=rgb2gray(f);
c=input('Enter the constant value, c = ');
[M,N]=size(g);
        for x = 1:M
            for y = 1:N
                m=double(g(x,y));
                z(x,y)=c.*log10(1+m); 
            end
        end
imshow(f), figure, imshow(z);
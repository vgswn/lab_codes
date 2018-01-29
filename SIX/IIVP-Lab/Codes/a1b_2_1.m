f = imread('lenna.jpg');
%imshow(f);

[m, n] = size(f);

x = input('Enter the No. of rows: ');
y = input('Enter the no. of columns: ');

dx = x/m;
dy = y/n;
scale = [dx dy];     
oldSize = size(f);                   
newSize = max(floor(scale.*oldSize(1:2)),1); 

rowIndex = min(round(((1:newSize(1))-0.5)./scale(1)+0.5),oldSize(1));
colIndex = min(round(((1:newSize(2))-0.5)./scale(2)+0.5),oldSize(2));

op = f(rowIndex,colIndex,:);
imshow(op);


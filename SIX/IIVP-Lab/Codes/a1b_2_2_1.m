f = imread('lenna.jpg');

[Rows, Cols] = size(f); 
Diagonal = sqrt(Rows^2 + Cols^2); 
RowPad = ceil(Diagonal - Rows) + 2;
ColPad = ceil(Diagonal - Cols) + 2;
imagepad = zeros(Rows+RowPad, Cols+ColPad);
imagepad(ceil(RowPad/2):(ceil(RowPad/2)+Rows-1),ceil(ColPad/2):(ceil(ColPad/2)+Cols-1)) = image;

degree=45;

%midpoints
midx=ceil((size(imagepad,1)+1)/2);
midy=ceil((size(imagepad,2)+1)/2);

imagerot=zeros(size(imagepad));

%rotation
for i=1:size(imagerot,1)
    for j=1:size(imagerot,2)

         x= (i-midx)*cos(rads)+(j-midy)*sin(rads);
         y=-(i-midx)*sin(rads)+(j-midy)*cos(rads);
         x=round(x)+midx;
         y=round(y)+midy;

         if (x>=1 && y>=1 && x<=size(imagepad,2) && y<=size(imagepad,1))
              imagerot(i,j)=imagepad(x,y); % k degrees rotated image         
         end

    end
end

 figure,imagesc(imagerot);
 %colormap(gray(256));
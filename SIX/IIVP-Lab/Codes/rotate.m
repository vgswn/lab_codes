% A3 = imread('cameraman.tif');
% %imshow(image)
% %A1=image(1:128, 1:128);
% %A2=image(129:256, 1:128);
% %A3=image(1:128, 129:256);
% %A4=image(129:256, 129:256);
% %subplot(2,2,1),subimage(A1);
% %subplot(2,2,2),subimage(A2);
% %subplot(2,2,3),subimage(A3);
% %subplot(2,2,4),subimage(A4);
% 
% %joining image
% %X=[A3;A4;A1;A2];
% 
% figure(1), clf, hold on
% subplot(1,2,1)
% imshow(A3);
% 
% degree = 90;
% 
% switch mod(degree, 360)
%     % Special cases
%     case 0
%         imagerot = A3;
%     case 90
%         imagerot = rot90(A3);
%     case 180
%         imagerot = A3(1:1:end, 1:1:end, :);
%     case 270
%         imagerot = rot90(A3(end:-1:1, end:-1:1, :));
% 
%     % General rotations
%     otherwise
% 
%         % Convert to radians and create transformation matrix
%         a = degree*pi/180;
%         R = [+cos(a) +sin(a); -sin(a) +cos(a)];
% 
%         % Figure out the size of the transformed image
%         [m,n,p] = size(A3);
%         dest = round( [1 1; 1 n; m 1; m n]*R );
%         dest = bsxfun(@minus, dest, min(dest)) + 1;
%         imagerot = zeros([max(dest) p],class(A3));
% 
%         % Map all pixels of the transformed image to the original image
%         for ii = 1:size(imagerot,1)
%             for jj = 1:size(imagerot,2)
%                 source = ([ii jj]-dest(1,:))*R.';
%                 if all(source >= 1) && all(source <= [m n])
% 
%                     % Get all 4 surrounding pixels
%                     C = ceil(source);
%                     F = floor(source);
% 
%                     % Compute the relative areas
%                     A = [...
%                         ((C(2)-source(2))*(C(1)-source(1))),...
%                         ((source(2)-F(2))*(source(1)-F(1)));
%                         ((C(2)-source(2))*(source(1)-F(1))),...
%                         ((source(2)-F(2))*(C(1)-source(1)))];
% 
%                     % Extract colors and re-scale them relative to area
%                     cols = bsxfun(@times, A, double(A3(F(1):C(1),F(2):C(2),:)));
% 
%                     % Assign                     
%                     imagerot(ii,jj,:) = sum(sum(cols),2);
% 
%                 end
%             end
%         end        
% end
% 
% subplot(1,2,2)
% imshow(imagerot);
C=[2 2 2 2 2 2;12 12 12 12 12 12;2 2 2 2 2 2;12 12 12 12 12 12;2 2 2 2 2 2];
image(C);
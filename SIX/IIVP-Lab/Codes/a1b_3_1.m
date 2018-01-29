%a = dec2bin(142);
%disp(a);

dec = 34;
i=0;
p=1;
while i == 0
     if dec/2 > 0
          if dec/2 ~= round(dec/2)
               bin(p) = 1;
          end
          if dec/2 == round(dec/2)
               bin(p) = 0;
          end
     end
     if dec/2 < 1
          bin(p) = 1;
          i = 1;
     else
          p=p+1;
          dec = floor(dec/2);
     end
end

disp(bin);

% function dec = bin2dec2(bin)
% binstring = [];
% if length(bin) > 1
%      for i = 1:length(bin)
%           tempstring = num2str(bin(i));
%           binstring = [binstring,tempstring];
%      end
% else
%      binstring=num2str(bin);
% end
% for i = 1:length(binstring);
%      value(i)=str2double(binstring(i)) ...
%      *(2^(length(binstring)-i));
% end
% dec=sum(value);

%str = dec2bin(10);
%disp(str);

num = input('Enter the number = ');
s1 = '';
while( num > 0)
    dig = mod(num,2);
    %disp(dig);
    str1 = num2str(dig);
    s1 = strcat(str1,s1);
    num = round(num/2 - 0.5);
end

disp(s1);
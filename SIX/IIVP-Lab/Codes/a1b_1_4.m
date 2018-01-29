a = randi([0, 255], 512, 512);
%b = mat2gray(a);

[m, n] = size(b);
%R = I(m/4:3*m/4, n/4:3*n/4, 1);
R = a(m/2-150:m/2+150, n/2-150:n/2+150);

%disp('The intensity value at coordinate 100×100 is: ');
j = R(100, 100);
s = sprintf('The intensity value at coordinate 100×100 is: %d', j);
disp(s);
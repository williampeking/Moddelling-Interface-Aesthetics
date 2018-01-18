function [ EM_y ] = EquilibriumMeasureY( n, area, y, y_c )

% n is the total number of the object on the frame
% area(i) is the area of the object 
% y(i) is the co-ordinate y of the centres of object i
% y_c is the co-ordinate y of the centres of the frame

% h_frame is the width of the frame
% Note that the maximum values of |y(i)-y_c| is h_frame/2

h_frame=0;
for i=1:1:n
   if abs(y(i)-y_c)>h_frame
       h_frame = abs(y(i)-y_c);
   end
end
h_frame=h_frame*2;

sum1=0;
sum2=0;

for i = 1:1:n
    sum1 = sum1 + area(i)*(y(i)-y_c);
    sum2 = sum2 + area(i);
end

EM_y=(2*sum1)/(n*h_frame*sum2);

end


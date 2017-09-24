function [ EM_x ] = EquilibriumMeasureX( n, area, x, x_c )

% n is the total number of the object on the frame
% area(i) is the area of the object 
% x(i) is the co-ordinate x of the centres of object i
% x_c is the co-ordinate x of the centres of the frame

% b_frame is the width of the frame
% Note that the maximum values of |x(i)-x_c| is b_frame/2

b_frame=0;
for i=1:1:n
   if abs(x(i)-x_c)>b_frame
       b_frame = abs(x(i)-x_c);
   end
end
b_frame=b_frame*2;

sum1=0;
sum2=0;

for i = 1:1:n
    sum1 = sum1 + area(i)*(x(i)-x_c);
    sum2 = sum2 + area(i);
end

EM_x=(2*sum1)/(n*b_frame*sum2);

end


function  EM  = EquilibriumMeasure( n, x, y, x_c, y_c, area, h_frame, b_frame)
% 
% n is the total number of the object on the frame
% area(i) is the area of the object i
% x(i) is the co-ordinate x of the centres of object i
% x_c is the co-ordinate x of the centres of the frame
% y(i) is the co-ordinate y of the centres of object i
% y_c is the co-ordinate y of the centres of the frame

% h_frame is the height of the frame
% Note that the maximum values of |y(i)-y_c| is h_frame/2
% b_frame is the width of the frame
% Note that the maximum values of |x(i)-x_c| is b_frame/2


sum_x=0;
sum_y=0;
sum=0;

for i = 1:1:n
    sum_x = sum_x + area(i)*(x(i)-x_c);
    sum_y = sum_y + area(i)*(y(i)-y_c);
    sum = sum + area(i);
end

EM_x=(2*sum_x)/(n*b_frame*sum);
EM_y=(2*sum_y)/(n*h_frame*sum);

EM = 1-(abs(EM_x)+abs(EM_y))/2;

end


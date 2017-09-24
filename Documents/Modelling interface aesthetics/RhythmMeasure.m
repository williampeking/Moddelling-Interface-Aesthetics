function [ RHM ] = RhythmMeasure( x, y, n, a, x_c, y_c )
% 
% UL, UR, LL, and LR stand for upper-left, upper-right, lower-left, and lower-right
% (x(i,j),y(i,j)) and (x_c,y_c) are the co-ordinates of the centres of object i on quadrant j and the frame
% aij is the area of the object
% nj is the total number of objects on the quadrant



X=zeros(1,4);
Y=zeros(1,4);
A=zeros(1,4);

for j=1:1:4
    for i=1:1:n(j)
        X(j) = X(j)+abs(x(i,j)-x_c);
        Y(j) = Y(j)+abs(y(i,j)-y_c);
        A(j) = A(j)+a(i,j);
    end
end

X=NormaliseValue(X);
Y=NormaliseValue(Y);
A=NormaliseValue(A);

RHM_area = abs(A(1)-A(2))+abs(A(1)-A(3))+abs(A(1)-A(4))+abs(A(2)-A(3))+abs(A(2)-A(4))+abs(A(3)-A(4));
RHM_area = RHM_area/6;

RHM_y = abs(Y(1)-Y(2))+abs(Y(1)-Y(3))+abs(Y(1)-Y(4))+abs(Y(2)-Y(3))+abs(Y(2)-Y(4))+abs(Y(3)-Y(4));
RHM_y = RHM_y/6;

RHM_x = abs(X(1)-X(2))+abs(X(1)-X(3))+abs(X(1)-X(4))+abs(X(2)-X(3))+abs(X(2)-X(4))+abs(X(3)-X(4));
RHM_x = RHM_x/6;

RHM = 1-(abs(RHM_x)+abs(RHM_y)+abs(RHM_area))/3;

end


function  SYM  = SymmetryMeasure( n, x, y, x_c, y_c ,b, h )
% 
% SYM is measure of symmetry
% rank of j following UL,UR,LL,LR
% UL, UR, LL and LR stand for upper-left, upper-right, lower-left and lower-right
% (x(i,j), y(i,j)) and (x_c, y_c) are the co-ordinates of the centres
% of object i on quadrant j and the frame
% b(i,j) and h(i,j) are the width and height of
% the object
% n(j) is the total number of objects on the quadrant.

X = zeros(1,4);
Y = zeros(1,4);
B = zeros(1,4);
H = zeros(1,4);
Theta = zeros(1,4);
R = zeros(1,4);

for j=1:1:4
    for i=1:1:n(j)
        X(j) = X(j) + abs(x(i,j)-x_c);
        Y(j) = Y(j) + abs(y(i,j)-y_c);
        B(j) = B(j) + b(i,j);
        H(j) = H(j) + h(i,j);
        Theta(j) = Theta(j) + abs( (y(i,j)-y_c)/(x(i,j)-x_c));
        R(j) = R(j) + sqrt( (x(i,j)-x_c)^2 + (y(i,j)-y_c)^2 );
    end
end

X = NormaliseValue(X);
Y = NormaliseValue(Y);
B = NormaliseValue(B);
H = NormaliseValue(H);
Theta = NormaliseValue(Theta);
R = NormaliseValue(R);

SYM_radial=0;
SYM_radial=SYM_radial+abs(X(1)-X(4))+abs(X(2)-X(3))+abs(Y(1)-Y(4))+abs(Y(2)-Y(3));
SYM_radial=SYM_radial+abs(B(1)-B(4))+abs(B(2)-B(3))+abs(H(1)-H(4))+abs(H(2)-H(3));
SYM_radial=SYM_radial+abs(Theta(1)-Theta(4))+abs(Theta(2)-Theta(3))+abs(R(1)-R(4))+abs(R(2)-R(3));
SYM_radial=SYM_radial/12;

SYM_vertical=0;
SYM_vertical=SYM_vertical+abs(X(1)-X(2))+abs(X(3)-X(4))+abs(Y(1)-Y(2))+abs(Y(3)-Y(4));
SYM_vertical=SYM_vertical+abs(B(1)-B(2))+abs(B(3)-B(4))+abs(H(1)-H(2))+abs(H(3)-H(4));
SYM_vertical=SYM_vertical+abs(Theta(1)-Theta(2))+abs(Theta(3)-Theta(4))+abs(R(1)-R(2))+abs(R(3)-R(4));
SYM_vertical=SYM_vertical/12;

SYM_horizontal=0;
SYM_horizontal=SYM_horizontal+abs(X(1)-X(3))+abs(X(2)-X(4))+abs(Y(1)-Y(3))+abs(Y(2)-Y(4));
SYM_horizontal=SYM_horizontal+abs(B(1)-B(3))+abs(B(2)-B(4))+abs(H(1)-H(3))+abs(H(2)-H(4));
SYM_horizontal=SYM_horizontal+abs(Theta(1)-Theta(3))+abs(Theta(2)-Theta(4))+abs(R(1)-R(3))+abs(R(2)-R(4));
SYM_horizontal=SYM_horizontal/12;

SYM = 1-(abs(SYM_vertical)+abs(SYM_horizontal)+abs(SYM_radial))/3;

end


function [ SYM_vertical ] = SymmetryMeasureVertical( X,Y,H,B,Theta,R )
% rank of i following UL,UR,LL,LR
% ALL the values should be normalised by NormoaliseValue function before.

SYM_vertical=0;
SYM_vertical=SYM_vertical+abs(X(1)-X(2))+abs(X(3)-X(4))+abs(Y(1)-Y(2))+abs(Y(3)-Y(4));
SYM_vertical=SYM_vertical+abs(B(1)-B(2))+abs(B(3)-B(4))+abs(H(1)-H(2))+abs(H(3)-H(4));
SYM_vertical=SYM_vertical+abs(Theta(1)-Theta(2))+abs(Theta(3)-Theta(4))+abs(R(1)-R(2))+abs(R(3)-R(4));
SYM_vertical=SYM_vertical/12;

end


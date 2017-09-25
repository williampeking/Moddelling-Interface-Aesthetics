function [ SYM_horizontal ] = SymmetryMeasureHorizontal( X,Y,H,B,Theta,R )
% rank of i following UL,UR,LL,LR
% ALL the values should be normalised by NormoaliseValue function before.

SYM_horizontal=0;
SYM_horizontal=SYM_horizontal+abs(X(1)-X(3))+abs(X(2)-X(4))+abs(Y(1)-Y(3))+abs(Y(2)-Y(4));
SYM_horizontal=SYM_horizontal+abs(B(1)-B(3))+abs(B(2)-B(4))+abs(H(1)-H(3))+abs(H(2)-H(4));
SYM_horizontal=SYM_horizontal+abs(Theta(1)-Theta(3))+abs(Theta(2)-Theta(4))+abs(R(1)-R(3))+abs(R(2)-R(4));
SYM_horizontal=SYM_horizontal/12;

end
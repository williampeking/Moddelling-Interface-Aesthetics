function [ SYM_radial ] = SymmetryMeasureRadial( X,Y,H,B,Theta,R )
% rank of i following UL,UR,LL,LR
% ALL the values should be normalised by NormoaliseValue function before.

SYM_radial=0;
SYM_radial=SYM_radial+abs(X(1)-X(4))+abs(X(2)-X(3))+abs(Y(1)-Y(4))+abs(Y(2)-Y(3));
SYM_radial=SYM_radial+abs(B(1)-B(4))+abs(B(2)-B(3))+abs(H(1)-H(4))+abs(H(2)-H(3));
SYM_radial=SYM_radial+abs(Theta(1)-Theta(4))+abs(Theta(2)-Theta(3))+abs(R(1)-R(4))+abs(R(2)-R(3));
SYM_radial=SYM_radial/12;

end
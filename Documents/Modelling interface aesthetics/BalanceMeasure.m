function  BM  = BalanceMeasure( n, a, d )

% wT is the weight of top
% wB is the weight of bottom
% wL is the weight of left
% wR is the weight of right
% w is the weight, following wL, wR, wT, wB
% n(j) is the total number of objects on the side j
% a(i,j) is the area of object i on the side j
% d(i,j) is the distance between the central lines of the objcet and the frame

w=zeros(1,4);
% inital weight
for j=1:1:4
    for i=1:1:n(j)
        w(j)=w(j)+a(i,j)*d(i,j);
        %sum the weight
    end
end

BM_vertical = (w(1) - w(2))/max(abs(w(1)),abs(w(2)));
BM_horizontal = (w(3) - w(4))/max(abs(w(3)),abs(w(4)));
BM = 1-(abs(BM_vertical)+abs(BM_horizontal))/2;

end


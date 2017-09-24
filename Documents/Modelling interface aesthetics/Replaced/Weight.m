function [ w ] = Weight( n, a, d )

% w is the weight, following wL, wR, wT, wB
% n is the total number of objects on the side
% a is the area of object i on the side j
% d is the distance between the central lines of the objhcet and the frame

w=zeros(1,n);
% inital weight
for j=1:1:4
    for i=1:1:n
        w(j)=w(j)+a(i,j)*d(i,j);
        %sum the weight
    end
end
end


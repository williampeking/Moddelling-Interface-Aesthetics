function [ SQM ] = SequenceMeasure( n, aq )
% The rank following UL, UR, LL, LR
% aq(i,j) is the area of object i on quadrant j
% Each quadrant is given a weighting in q

w = zeros(1,4);
q = [4,3,2,1];
v=zeros(1,4);

for j=1:1:4
    sum = 0;
    for i=1:1:n
        sum = sum+aq(i,j);
    end
    w(j) = sum*q(j);
end

[temp,index] = sort(w);

for i=1:1:n
    v(index(i)) = i;
end
% using index to get the rank of w
% temp is useless

SUM = 0;
for j = 1:1:4
    SUM = SUM+abs(q(j)-v(j));
end
SQM = 1-SUM/8;

end


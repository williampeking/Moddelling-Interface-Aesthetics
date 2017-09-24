function w=SquenceMeasureWeight(n,aq)

w=zeros(1,4);
q=[4,3,2,1];

for j=1:1:4
    sum=0;
    for i=1:1:n
        sum=sum+aq(i,j);
    end
    w(j)=sum*q(j);

end
end

function [ PM ] = ProportionMeasure( n, h, b, h_layout, b_layout)
% ps(j) is the proportion of shape j with Square, Square root of two,
% Golden rectangle, Square root of three, Double square.
% following sq, r2 gr r3 ds
% blayout and hlayout are the width and height of the layout.
ps=[1, 1/1.414, 1/1.618, 1/1.732, 1/2 ];

r_layout = h_layout/b_layout;
if r_layout<=1
    p_layout = r_layout;
else
    p_layout = 1/r_layout;
end
MIN_layout = min(abs(ps(1)-p_layout), abs(ps(1)-p_layout),abs(ps(2)-p_layout),abs(ps(3)-p_layout), abs(ps(4)-p_layout), abs(ps(5)-p_layout));
PM_layout=1 - MIN_layout/0.5;

r=zeros(1,n);
p=zeros(1,n);
SUM=0;
for i=1:1:n

    r(i)=h(i)/b(i);
    if r(i)<=1
        p(i)=r(i);
    else
        p(i)=1/r(i);
    end
% calculate the p(i)

    MIN_object = min(abs(ps(1)-p(i)), abs(ps(1)-p(i)),abs(ps(2)-p(i)),abs(ps(3)-p(i)), abs(ps(4)-p(i)), abs(ps(5)-p(i)));
    SUM = SUM + (1 - MIN_object/0.5);

end
PM_object=SUM/n;

PM = (abs(PM_object)+abs(PM_layout))/2;

end


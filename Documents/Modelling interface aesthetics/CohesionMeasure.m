function [ CM ] = CohesionMeasure( n, h_layout, b_layout, h_frame, b_frame, h, b )
% n is the number of objects on the frame.
% bi and hi the width and height of object i
% blayout and hlayout and bframe and hframe are the widths and heights of the layout and the frame
c_fl=(h_layout/b_layout)/(h_frame/b_frame);

if c_fl<=1
    CM_fl=c_fl;
else
    CM_fl=1/c_fl;
end

c_lo=zeros(1,n);
for i=1:1:n
    c_lo(i)=(h(i)/b(i))/(h_layout/b_layout);
end
t=zeros(1,n);
for i=1:1:n
    if c_lo(i)<=1
        t(i)=c_lo(i);
    else
        t(i)=1/c_lo(i);
    end
end

T=0;
for i=1:1:n
    T=T+T(i);
end
CM_lo=T/n;

CM=(abs(CM_fl)+abs(CM_lo))/2;

end


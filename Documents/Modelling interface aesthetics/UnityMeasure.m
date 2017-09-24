function [ UM ] = UnityMeasure(n, n_size, a ,a_layout, a_frame )
% n_size is the number of sizes used
% n is the number of objects on the frame
% a(i), a_layout, and a_frame are the areas of object i, the layout, and the frame

UM_form = 1-(n_size-1)/n;

sum=0;
for i=1:1:n
    sum=sum+a(i);
end
UM_space = 1-(a_layout-sum)/(a_frame-sum);

UM = (abs(UM_form)+abs(UM_space))/2;

end


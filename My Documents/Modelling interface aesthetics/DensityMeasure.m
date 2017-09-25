function [ DM ] = DensityMeasure( n, a_frame, a )
% 
% ai and aframe are the areas of object i and the frame
% n is the number of objects on the frame
sum=0;
for i=1:1:n
    sum = sum+a(i);
end
DM = 1-2*abs(0.5-sum/a_frame);

end


function [ RM ] = RegularityMeasure( n, n_vap, n_hap, n_spacing)
% 
% n_vap and n_hap are the numbers of vertical and horizontal alignment points
% n_spacing is the number of distinct distances between column and row starting points
% n is the number of objects on the frame.

if n == 1
    RM_alignment = 1;
    RM_spacing = 1;
else
    RM_alignment = 1-(n_vap+n_hap)/(2*n);
    RM_spacing = 1-(n_spacing-1)/(2*n-2);
end

RM = (abs(RM_alignment)+abs(RM_spacing))/2;

end


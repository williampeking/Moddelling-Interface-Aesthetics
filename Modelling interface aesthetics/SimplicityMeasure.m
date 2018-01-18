function [ SMM ] = SimplicityMeasure( n_vap, n_hap, n )

% nvap and nhap are the numbers of vertical and horizontal alignment points
% n is the number of objects on the frame.

SMM = 3/(n_vap+n_hap+n);

end


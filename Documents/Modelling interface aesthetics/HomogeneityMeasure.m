function [ HM ] = HomogeneityMeasure( n, n_UL, n_UR, n_LL, n_LR )
% 
% n is the number of objects on the frame
% n_UL, n_UR, n_LL, and n_LR are the numbers of objects on the 
% upper-left, upper-right, lower-left, and lower-right quadrants

W_max = factorial(n)/(gamma(n/4+1))^4;
% calculate (n/4)! by using gamma function

W = factorial(n)/(factorial(n_UL)*factorial(n_UR)*factorial(n_LL)*factorial(n_LR));

HM = W/W_max;

end


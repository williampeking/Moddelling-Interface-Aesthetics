function [ Theta ] = SymmetryMeasureTheta( n, x, y, x_c, y_c )

Theta = zeros(1,4);
for j=1:1:4
    for i=1:1:n
        Theta(j) = Theta(j) + abs( (y(i,j)-y_c)/(x(i,j)-x_c));
    end
end
end


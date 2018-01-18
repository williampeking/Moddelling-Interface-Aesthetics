function [ R ] = SymmetryMeasureR( n, x, y, x_c, y_c )

R = zeros(1,4);
for j=1:1:4
    for i=1:1:n
        R(j) = R(j) + sqrt( (x(i,j)-x_c)^2 + (y(i,j)-y_c)^2 );
    end
end

end


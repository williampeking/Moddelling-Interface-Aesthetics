function [ Y ] = SymmetryMeasureY( n, y, y_c )

Y = zeros(1,4);
for j=1:1:4
    for i=1:1:n
        Y(j) = Y(j) + abs(y(i,j)-y_c);
    end
end
end


function [ X ] = SymmetryMeasureX( n, x, x_c )

X = zeros(1,4);
for j=1:1:4
    for i=1:1:n
        X(j) = X(j) + abs(x(i,j)-x_c);
    end
end
end


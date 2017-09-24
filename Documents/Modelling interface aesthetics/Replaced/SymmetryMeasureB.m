function [ B ] = SymmetryMeasureB( n, b )

B = zeros(1,4);
for j=1:1:4
    for i=1:1:n
        B(j) = B(j) + b(i,j);
    end
end
end


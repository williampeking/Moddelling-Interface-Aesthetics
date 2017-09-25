function [ H ] = SymmetryMeasureH( n, h )

H = zeros(1,4);
for j=1:1:4
    for i=1:1:n
        H(j) = H(j) + h(i,j);
    end
end
end


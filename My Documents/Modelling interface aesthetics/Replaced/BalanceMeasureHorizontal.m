function [ BM_horizontal ] = BalanceMeasureHorizontal( wT, wB )

% BM_horizontal is measure of balance in side of horizontal
% wT is the weight of top
% wB is the weight of bottom

BM_horizontal = (wT - wB)/max(abs(wT),abs(wB));

end


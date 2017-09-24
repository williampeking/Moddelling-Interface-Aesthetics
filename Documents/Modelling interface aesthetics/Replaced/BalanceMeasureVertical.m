function [ BM_vertical ] = BalanceMeasureVertical( wL, wR )

% BM_vertical is measure of balance in side of vertical
% wL is the weight of left
% wR is the weight of right

BM_vertical = (wL - wR)/max(abs(wL),abs(wR));

end


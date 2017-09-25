function [ OM ] = OrderAndComplexityMeasure( M )
% 
% M = {M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13}
%  = {BM,EM,SYM,SQM,CM,UM,PM,SMM,DM,RM,ECM,HM,RHM}
% weight are assumed as 1
OM = 0;

for i=1:1:sizeof(M)
    OM = OM+ M(i);
end

OM = OM/sizeof(M);

end


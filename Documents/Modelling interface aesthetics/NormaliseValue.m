function [ OutputValues ] = NormaliseValue( InputValues )

    n=sizeof(InputValues);
    Sum=0;
    OutputValues=zeros(1,n);
    for i=1:1:n
        Sum=Sum+InputValues(i);
    end
    
    for i=1:1:n
        OutputValues(i)=InputValues(i)/Sum;
    end
    
end


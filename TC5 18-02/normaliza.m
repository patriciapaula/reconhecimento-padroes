function n=normaliza(x)
    n=[0 0];
    
    for i=1:size(x,1)
        n(i,:)=x(i,:)./(max(x)-min(x));
    end
end
function ve=embaralha(v,qtde)
    i=randperm(size(v,1));
    for k=1:size(i,2)
        ind=i(1,k);
        ve(k,:)=v(ind,:);
    end
    %se passou quantidade, retorna apenas uma parte dos dados
    if qtde>0
        ve=ve(1:qtde,:);
    end
end
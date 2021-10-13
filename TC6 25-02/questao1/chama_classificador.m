function [result]=chama_classificador(dados,m1,m2,m3)
    for i=1:size(dados,1)
        ponto=dados(i,:);
        
        result(i,1)=dados(i,1); %rotulo
        
        if dem(ponto,m2)<dem(ponto,m1) & dem(ponto,m2)<dem(ponto,m3)
            result(i,2)=1;
        else if dem(ponto,m1)<dem(ponto,m2) & dem(ponto,m1)<dem(ponto,m3)
                result(i,2)=2;
            else
                result(i,2)=3;
            end
        end
    end
end
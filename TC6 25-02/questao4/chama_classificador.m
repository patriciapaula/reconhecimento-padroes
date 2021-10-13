function [result]=chama_classificador(dados,mc1,mc2,mc3)
    mc1=mc1(1,2:3);
    mc2=mc2(1,2:3);
    mc3=mc3(1,2:3);
    
    hold on;
    for i=1:size(dados,1)
        ponto=dados(i,2:3);
        result(i,1)=dados(i,1); %classe conhecida
        
        if dem(ponto,mc2)<dem(ponto,mc1) & dem(ponto,mc2)<dem(ponto,mc3)
            result(i,2)=1;
            plot(ponto(1,2),ponto(1,1),'g+');
        else if dem(ponto,mc1)<dem(ponto,mc2) & dem(ponto,mc1)<dem(ponto,mc3)
                result(i,2)=2;
                plot(ponto(1,2),ponto(1,1),'r+');
            else
                result(i,2)=3;
                plot(ponto(1,2),ponto(1,1),'b+');
            end
        end
    end
    hold off;
end
function [result]=chama_classificador(dados,me,mh,mn,classificador,plotasd)
    hold on;
    result=[0 0 0 0 0 0];
    for i=1:size(dados,1)
        ponto=dados(i,1:2);
        
        result(i,1)=dados(i,1);
        result(i,2)=dados(i,2);
        result(i,3)=dados(i,3);
        result(i,4)=dados(i,4);
        result(i,5)=dados(i,5);
        
        if classificador==1 % dem
            if dem(ponto,mh)<dem(ponto,me) & dem(ponto,mh)<dem(ponto,mn)
                result(i,6)=1;
                plot(ponto(1,2),ponto(1,1),'g+');
            else if dem(ponto,me)<dem(ponto,mh) & dem(ponto,me)<dem(ponto,mn)
                    result(i,6)=2;
                    plot(ponto(1,2),ponto(1,1),'c+');
                else
                    result(i,6)=3;
                    plot(ponto(1,2),ponto(1,1),'m+');
                end
            end
        else if classificador==2 % dmm 1a questão
                if dmm(ponto,mh)<dmm(ponto,me) & dmm(ponto,mh)<dmm(ponto,mn)
                    result(i,6)=1;
                    plot(ponto(1,2),ponto(1,1),'g*');
                else if dmm(ponto,me)<dmm(ponto,mh) & dmm(ponto,me)<dmm(ponto,mn)
                        result(i,6)=2;
                        plot(ponto(1,2),ponto(1,1),'b+');
                    else
                        result(i,6)=3;
                        plot(ponto(1,2),ponto(1,1),'mO');
                    end
                end  
            end
        end
    end
    
    superficie_decisao(dados, mh, me, mn, classificador, plotasd);
    hold off;
end
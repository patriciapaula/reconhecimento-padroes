function [result]=chama_classificador_dmm2(dados,me,mh,mn,c1,c2,c3,plotasd)
    hold on;
    result=[0 0 0 0 0 0];
    
    for i=1:size(dados,1)
        ponto=dados(i,1:2);
        
        result(i,1)=dados(i,1);
        result(i,2)=dados(i,2);
        result(i,3)=dados(i,3);
        result(i,4)=dados(i,4);
        result(i,5)=dados(i,5);
        
        if dmm2(ponto,mh,c1,c2,c3)<dmm2(ponto,me,c1,c2,c3) & dmm2(ponto,mh,c1,c2,c3)<dmm2(ponto,mn,c1,c2,c3)
            result(i,6)=1;
            plot(ponto(1,2),ponto(1,1),'g*');
        else if dmm2(ponto,me,c1,c2,c3)<dmm2(ponto,mh,c1,c2,c3) & dmm2(ponto,me,c1,c2,c3)<dmm2(ponto,mn,c1,c2,c3)
                result(i,6)=2;
                plot(ponto(1,2),ponto(1,1),'b+');
            else
                result(i,6)=3;
                plot(ponto(1,2),ponto(1,1),'mO');
            end
        end 
    end
    
    superficie_decisao(dados, mh, me, mn, 1, plotasd);
    hold off;
end
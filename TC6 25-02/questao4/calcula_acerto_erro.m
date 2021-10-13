function [txAcerto,txErro]=calcula_acerto_erro(result, q1, q2, q3)
    % compara itens classificados com rotulo original
    
    txAcerto1=0;txAcerto2=0;txAcerto3=0;
    txErro1=0;txErro2=0;txErro3=0;

    for i=1:size(result,1)
        if result(i,1)==1
            if result(i,2)==1 
                txAcerto1=txAcerto1+1;
            else
                txErro1=txErro1+1;
            end
        else if result(i,1)==2
                if result(i,2)==2 
                    txAcerto2=txAcerto2+1;
                else
                    txErro2=txErro2+1;
                end
            else if result(i,1)==3
                    if result(i,2)==3
                        txAcerto3=txAcerto3+1;
                    else
                        txErro3=txErro3+1;
                    end
                end
            end
        end
    end


    txAcerto=[txAcerto1*100/q1, txAcerto2*100/q2, txAcerto3*100/q3];
    txErro=[txErro1*100/q1, txErro2*100/q2, txErro3*100/q3];
end
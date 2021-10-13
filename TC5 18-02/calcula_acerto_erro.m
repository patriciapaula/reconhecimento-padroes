function [txAcerto,txErro]=calcula_acerto_erro(result, qh, qe, qn)
    % compara itens classificados com rotulo original
    % Hérnia de Disco   [1 -1 -1] = 1 
    % Espondilolistese  [-1 1 -1] = 2
    % Normal            [-1 -1 1] = 3
    
    txAcertoH=0;txAcertoE=0;txAcertoN=0;
    txErroH=0;txErroE=0;txErroN=0;
    for i=1:size(result,1)
        if result(i,3)==1 & result(i,4)==-1 & result(i,5)==-1
            if result(i,6)==1 
                txAcertoH=txAcertoH+1;
            else
                txErroH=txErroH+1;
            end
        else if result(i,3)==-1 & result(i,4)==1 & result(i,5)==-1
                if result(i,6)==2 
                    txAcertoE=txAcertoE+1;
                else
                    txErroE=txErroE+1;
                end
            else if result(i,3)==-1 & result(i,4)==-1 & result(i,5)==1
                    if result(i,6)==3
                        txAcertoN=txAcertoN+1;
                    else
                        txErroN=txErroN+1;
                    end
                end
            end
        end
    end
    
    txAcerto=[txAcertoH*100/qh, txAcertoE*100/qe, txAcertoN*100/qn];
    txErro=[txErroH*100/qh, txErroE*100/qe, txErroN*100/qn];
    temp=1;
end
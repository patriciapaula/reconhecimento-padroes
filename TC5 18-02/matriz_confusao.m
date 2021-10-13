function [c, ordem]=matriz_confusao(r)
    % r possui os dados dos atributos, da classe conhecida e da classe estimada
    z=r(:,3:5);
    calculado=r(:,6);
    
    hernia(1,1:3)=[1 -1 -1];
    espond(1,1:3)=[-1 1 -1];
    normal(1,1:3)=[-1 -1 1];
    
    for y=1:size(z,1)
        if z(y,:)==hernia
            esperado(y,:)=1;
        else if z(y,:)==espond
                esperado(y,:)=2;
            else if z(y,:)==normal
                    esperado(y,:)=3;
                end
            end
        end
    end
    
    [c, ordem]=confusionmat(esperado,calculado);
end
function [c1teste, c1treino, c2teste, c2treino, c3teste, c3treino]=separa_dados_teste_treino(c1, c2, c3)
    % separando 50% teste / 50% treino 
    
    % class 1 59 
    % class 2 71
    % class 3 48
    
    t=round(size(c1,1)/2)-1;
    c1teste=c1(1:t,:);
    c1treino=c1(t+1:end,:);
    
    t=round(size(c2,1)/2)-1;
    c2teste=c2(1:t,:);    
    c2treino=c2(t+1:end,:);
    
    t=round(size(c3,1)/2)-1;
    c3teste=c3(1:t,:);
    c3treino=c3(t+1:end,:);
end
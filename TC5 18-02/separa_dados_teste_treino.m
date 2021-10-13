function [hte, htr, ete, etr, nte, ntr]=separa_dados_teste_treino(hernia, esp, normal)
    % separando 20% teste / 80% treino 
    
    % hernia -  60: 12 + 48
    % espodi - 150: 30 + 120
    % normal - 100: 20 + 80
    
    hte=hernia(1:12,:);
    htr=hernia(13:end,:);
    
    ete=esp(1:30,:);    
    etr=esp(31:end,:);
        
    nte=normal(1:20,:);
    ntr=normal(21:end,:);
end
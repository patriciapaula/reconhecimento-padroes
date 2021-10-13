function []=classifica(x)
% load wine.data;
% x=wine;
% classifica(x);

    qtdeIteracoes=50;
    
    % rotulo na 1a coluna; da 2a em diante est�o os atributos
    load wine.data;
    z=wine;

    rot=z(:,1);
    z=z(:,2:end);

    % seleciona at� metade dos atributos
    dim=5;

    %usando sele��o de atributos forward
    atributos=forward(z,dim);
    
    x=[];
    cont=0;
    %apenas atributos selecionados
    for idx=1:size(atributos,1)
        cont=cont+1;
        x(:,idx)=z(:,atributos(cont));
    end
    
    % *** Treino ***
    
    % junta atributos com rotulo
    x=cat(2,rot,x);

    % separando as classes
    [c1, c2, c3]=separa_classes(x);

    % separando 50% teste / 50% treino
    [c1testet, c1treinot, c2testet, c2treinot, c3testet, c3treinot]=separa_dados_teste_treino(c1,c2,c3);

    for w=1:qtdeIteracoes
        % embaralha dados de treino - em cada iteracao pega apenas 20% dos 80% para treinar
        c1treino=embaralha(c1treinot, round(size(c1treinot,1)/5)-1); 
        c2treino=embaralha(c2treinot, round(size(c2treinot,1)/5)-1); 
        c3treino=embaralha(c3treinot, round(size(c3treinot,1)/5)-1);
        
        % calculando media de treino
        m1 = mean(c1treino);
        m2 = mean(c2treino);
        m3 = mean(c3treino);
        
        % reunifica dados para facilitar comparacao
        treino=cat(1,c1treino(:,:),c2treino(:,:));
        treino=cat(1,treino(:,:),c3treino(:,:));
        
        % classifica 
        [result]=chama_classificador(treino,m1,m2,m3);
    
        % calcula taxas de erro e acerto
        [txAcerto,txErro]=calcula_acerto_erro(result, size(c1treino,1), size(c2treino,1), size(c3treino,1));
        
        dadosIteracao(w,1:3)=txAcerto;
        dadosIteracao(w,4:6)=txErro;
    end

    % no treino:
    media_acertos_treino=sum(txAcerto)/3
    maxim_acertos_treino=max(txAcerto)
    minim_acertos_treino=min(txAcerto)
    medtr_1=mean(txAcerto(:,1))
    medtr_2=mean(txAcerto(:,2))
    medtr_3=mean(txAcerto(:,3))
        
end
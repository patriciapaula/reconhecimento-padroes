function []=questao4()
    load wine.data;
    % pega rotulo e 2 primeiros atributos
    z=wine;
    x=wine(:,1:3);

    % separa classes
    c1=z(1:59,:);
    c2=z(60:130,:);
    c3=z(131:end,:);

    % divide em treino e teste
    t=round(size(c1,1)/2)-1;
    c1teste=c1(1:t,:);
    c1treino=c1(t+1:end,:);

    t=round(size(c2,1)/2)-1;
    c2teste=c2(1:t,:);    
    c2treino=c2(t+1:end,:);

    t=round(size(c3,1)/2)-1;
    c3teste=c3(1:t,:);
    c3treino=c3(t+1:end,:);

    % reunifica dados para facilitar comparacao
    treino=cat(1,c1treino(:,:),c2treino(:,:));
    treino=cat(1,treino(:,:),c3treino(:,:));

    % calculando as medias - só 2 primeiros atributos
    mc1 = mean(c1);
    mc2 = mean(c2);
    mc3 = mean(c3);

    % qtde a ser variada 
    qtde=5;

    % passa apenas os atributos
    [y,cy]=meu_pca(treino(:,2:end),qtde);

    y2=cat(2,treino(:,1),y(:,:));

    [result]=chama_classificador(y2,mc1,mc2,mc3);
    [txAcerto,txErro]=calcula_acerto_erro(result, size(c1treino,1), size(c2treino,1), size(c3treino,1));

    'aqui'
    qtde
    txAcerto
    txErro
end

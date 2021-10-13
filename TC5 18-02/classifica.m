function []=classifica(z,rot,classificador)
    % z: atributos a comparar (2 a 2)
    % rot: rotulos
    % classificador: dem=1 ou dmm=2
        
    % apenas dem precisa normalizar
    if classificador==1 %dem
        x=normaliza(z); 
    else
        x=z;
    end
    
    qtdeIteracoes=50;
    plotasd=0;
    
    % junta atributos com rotulo
    x=cat(2,x,rot);

    % separando as classes
    [hernia, esp, normal]=separa_classes(x);

    % separando 20% teste / 80% treino
    [htet, htrt, etet, etrt, ntet, ntrt]=separa_dados_teste_treino(hernia, esp, normal);
    
    % --- plotando dados brutos pra ver como estão distribuídos
    %plota_dados_brutos(cat(1,htrt,htet),cat(1,etrt,etet),cat(1,ntrt,ntet));
    % ---------------------------------------------------
        
    
    % *** Treino ***

    for w=1:qtdeIteracoes
        % embaralha dados de treino - em cada iteracao pega apenas 20% dos 80% para treinar
        htr=embaralha(htrt, round(size(htrt,1)/5)-1); 
        etr=embaralha(etrt, round(size(etrt,1)/5)-1); 
        ntr=embaralha(ntrt, round(size(ntrt,1)/5)-1);
        
        % calculando as medias de treino
        mh = mean(htr(:,1:2));
        me = mean(etr(:,1:2));
        mn = mean(ntr(:,1:2));
        
        % reunifica dados para facilitar comparacao
        treino=cat(1,htr(:,:),etr(:,:));
        treino=cat(1,treino(:,:),ntr(:,:));
    
        % classifica e plota o gráfico de acordo com o classificador 
        % o 0 indica q não precisa exibir a sd; o 1 que precisa
        [result]=chama_classificador(treino,me,mh,mn,classificador,plotasd);
    
        % calcula taxas de erro e acerto
        [txAcerto,txErro]=calcula_acerto_erro(result, size(htr,1), size(etr,1), size(ntr,1));
        
        dadosIteracao(w,1:3)=txAcerto;
        dadosIteracao(w,4:6)=txErro;
        dadosIteracao(w,7:8)=mh;
        dadosIteracao(w,9:10)=me;
        dadosIteracao(w,11:12)=mn;
    end
    
    
    % *** Teste ***
    
    % limpa gráficos
    clf;
        
    % que valores de media tiveram maior acerto
    somaAcertos=sum(dadosIteracao(:,1:3),2);
    [v linha]=max(somaAcertos);
    
    mhteste(1,:)=dadosIteracao(linha,7:8);
    meteste(1,:)=dadosIteracao(linha,9:10);
    mnteste(1,:)=dadosIteracao(linha,11:12);


    % embaralha dados para realizar testes
    hte=embaralha(htet, 0); 
    ete=embaralha(etet, 0); 
    nte=embaralha(ntet, 0); 

    % reunifica dados para facilitar comparacao
    teste=cat(1,hte(:,:),ete(:,:));
    teste=cat(1,teste(:,:),nte(:,:));

    % classifica e plota o gráfico de acordo com o classificador 
    % o 0 indica q não precisa exibir a sd; o 1 que precisa
    [resultTeste]=chama_classificador(teste,meteste,mhteste,mnteste,classificador,plotasd);

    % calcula taxas de erro e acerto
    [txAcertoTeste,txErroTeste]=calcula_acerto_erro(resultTeste, size(hte,1), size(ete,1), size(nte,1));

    % matriz de confusão
    [c, ordem]=matriz_confusao(resultTeste);
    
    
    
    % *** finaliza - taxas de acerto média, mínima, máxima e médias por classe 
    
    % no treino:
    media_acertos_treino=sum(txAcerto)/3;
    maxim_acertos_treino=max(txAcerto);
    minim_acertos_treino=min(txAcerto);
    medtr_h=mean(txAcerto(:,1));
    medtr_e=mean(txAcerto(:,2));
    medtr_n=mean(txAcerto(:,3));
    
    % no teste:
    media_acertos_teste=sum(txAcertoTeste)/3;
    maxim_acertos_teste=max(txAcertoTeste);
    minim_acertos_teste=min(txAcertoTeste);
    medte_h=mean(txAcertoTeste(:,1));
    medte_e=mean(txAcertoTeste(:,2));
    medte_n=mean(txAcertoTeste(:,3));
    
    % exibindo matriz de confusao
    c
    
    % exibindo taxas
    'treino'
    media_acertos_treino
    maxim_acertos_treino
    minim_acertos_treino
    medtr_h
    medtr_e
    medtr_n
    
    'teste'
    media_acertos_teste
    maxim_acertos_teste
    minim_acertos_teste
    medte_h
    medte_e
    medte_n
end
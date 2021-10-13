function []=classifica2_dmm(z,rot)
    % z: atributos a comparar (2 a 2)
    % rot: rotulos
    
    x=z;
    plotasd=0;
        
    % junta atributos com rotulo
    x=cat(2,x,rot);

    % separando as classes
    [hernia, esp, normal]=separa_classes(x);

    % separando 20% teste / 80% treino
    [htet, htrt, etet, etrt, ntet, ntrt]=separa_dados_teste_treino(hernia, esp, normal);

    
    % *** Treino ***

    % embaralha dados de treino - usa todos os dados para treinar
    htr=embaralha(htrt, 0);
    etr=embaralha(etrt, 0);
    ntr=embaralha(ntrt, 0);

    % calculando as medias de treino
    mh = mean(htr(:,1:2));
    me = mean(etr(:,1:2));
    mn = mean(ntr(:,1:2));

    % reunifica dados para facilitar comparacao
    treino=cat(1,htr(:,:),etr(:,:));
    treino=cat(1,treino(:,:),ntr(:,:));

    % classifica e plota o gráfico de acordo com o classificador 
    % o 0 indica q não precisa exibir a sd; o 1 que precisa
    [result]=chama_classificador_dmm2(treino,me,mh,mn,etr,htr,ntr,plotasd);

    % calcula taxas de erro e acerto
    [txAcerto,txErro]=calcula_acerto_erro(result, size(htr,1), size(etr,1), size(ntr,1));

    
    % *** Teste ***
    
    % limpa gráficos
    clf;
       
    % só houve uma iteração
    mhteste(1,:)=mh;
    meteste(1,:)=me;
    mnteste(1,:)=mn;
    
    % embaralha dados para realizar testes
    hte=embaralha(htet, 0); 
    ete=embaralha(etet, 0); 
    nte=embaralha(ntet, 0); 

    % reunifica dados para facilitar comparacao
    teste=cat(1,hte(:,:),ete(:,:));
    teste=cat(1,teste(:,:),nte(:,:));

    % classifica e plota o gráfico de acordo com o classificador 
    % o 0 indica q não precisa exibir a sd; o 1 que precisa
    [resultTeste]=chama_classificador_dmm2(teste,meteste,mhteste,mnteste,ete,hte,nte,plotasd);

    % calcula taxas de erro e acerto
    [txAcertoTeste,txErroTeste]=calcula_acerto_erro(resultTeste, size(hte,1), size(ete,1), size(nte,1));

    
    % *** finaliza - taxas de acerto média, mínima, máxima e médias por classe 

    % matriz de confusão
    [c, ordem]=matriz_confusao(resultTeste);
    
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
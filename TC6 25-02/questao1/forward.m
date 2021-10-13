function atributos=forward(x,dim);
    atributos=0;
        
    %colunas selecionadas
    col_selecionadas=[]; 
    %colunas disponiveis para serem selecionadas
    col_disponiveis=[];  
    
    %colunas selecionadas a cada rodada
    selecao1=[]; 
    selecao2=[]; 
    
    %atribui o indice das colunas disponiveis
    for k=1:size(x,2)
        col_disponiveis=[col_disponiveis; k];
    end
    
    cont=0;
    %ate que o numero de col disponiveis seja igual ao num atrib desejados
    while (cont ~= dim)
        cont=cont+1;
        distancia=[];
        
        %de 1 ate o num de col ainda disponiveis para selecao
        for m=1:size(col_disponiveis,1)
            amostra1=[];
            amostra2=[];
            
            %seleciona amostras
            amostra1=[selecao1 x(:,col_disponiveis(m))];
            amostra2=[selecao2 x(:,col_disponiveis(cont))];
            
            %calcula distancia euclidiana entre as amostras
            valor=dem(amostra1, amostra2);
            distancia= [distancia; [col_disponiveis(m) valor]];
        end
        [Y, I]=max(distancia);
        
        %linha da lista que contem a col selecionada com maior distancia
        col_selecionadas=[col_selecionadas; distancia(I(2))];
        
        aux=[];
        % de 1 ate num de col disponiveis para selecao
        for b=1:size(col_disponiveis, 1)
            if (col_disponiveis(b)~= col_selecionadas(cont))
                aux=[aux; col_disponiveis(b)];
            end
        end
        
        col_disponiveis=aux;
                
        %numero de col selecionadas igual ao numero de col disponiveis 
        if ((size(col_selecionadas,1))==dim) & (size(col_disponiveis,1)==1)
            col_selecionadas=[col_selecionadas; col_disponiveis(1)];
            cont=cont+1;
        end
    end
    atributos=col_selecionadas;
end
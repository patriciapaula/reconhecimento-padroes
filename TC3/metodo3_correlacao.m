function R=metodo3_correlacao(X,i);

    % chamada: R2=metodo3_correlacao(X/norm(X),size(X,2));

    p = size(X,2);
    %N = size(X,1); *** apagar
    %R = eye(p);    *** apagar

    % lembrete: matriz linha x coluna
    % linha  = unidade amostral
    % coluna = variaveis
    
    % N vetores estao organizados como as colunas de uma matriz    
    
    R = eye(p);
    for i=1:p   % linha x coluna
        a = (i-1)/i;
        if i>1
            temp = (1-a) * X(i,:)' * X(i,:);
            R(:,i) = a * R(:,i-1) + temp(:,i);
        else
            temp = (1-a) * X(i,:)' * X(i,:);
            R(:,i) = temp(:,i);
        end
        R(:,i)
    end
end
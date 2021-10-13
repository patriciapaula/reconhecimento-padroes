function C=metodo1_cov(X)
    N=size(X,1);
    p=size(X,2);
    soma=zeros(p);
    M=sum(X)/N;
    for i=1:N,
        soma = soma + (X(i,:)-M)'*(X(i,:)-M);
    end
    C=soma/N;
end

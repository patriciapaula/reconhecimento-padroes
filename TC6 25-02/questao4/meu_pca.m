function [y,cy]=meu_pca(x,qtde)
    % 1) calcula a media
    m=mean(x);

    % 2) gera nova matriz subtraindo a media da matriz original
    xc=x-repmat(m,size(x,1),1);

    % 3) estima a matriz de covari�ncia usando xc
    cx=cov(xc);

    % 4) determina autovalores e autovetores associados a xc (eigenvalues and
    % eigenvectors)
    [avet,aval] = eig(cx);

    % 5) ordenar autovalores em ordem decrescente de magnitude
    autovalores=flipud(aval);
    autovetores=flipud(avet);

    % 6) autovetores associados aos autovalores ordenados do maior para o menor
    % (da esq para a dir)
    l=fliplr(autovalores);
    q=fliplr(autovetores);

    % 6b)escolher um valor de q 
    soma_reduz=sum(sum(l(:,1:qtde)));
    soma_total=sum(sum(l(:,:)));
    ve=soma_reduz/soma_total;

    % 7) gerar nova matriz Y: Y = XQ
    y = x*q;

    % 8) estimar a matriz de covari�ncia cy usando a matrix y
    cy=cov(y);
end
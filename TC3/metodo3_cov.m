function C=metodo3_cov(X)
    N=size(X,1);
    M=sum(X)/N;    
    R=eye(p,p);
    p=size(X,2);
    R=metodo3_correlacao(X,R,p);
    C=R-(M'*M);
end
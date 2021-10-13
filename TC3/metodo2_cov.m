function C=metodo2_cov(X)
    N=size(X,1);
    M=sum(X)/N;    
    R=(1/N)*(X'*X);
    C=R-(M'*M);
end
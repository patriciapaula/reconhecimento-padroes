% matlab cov number of observations

% http://www.mathworks.com/help/matlab/ref/cov.html

% usando a fun��o COV no matlab:
load coluna.dat
X = coluna
C = cov(X,1) % normaliza por N-1

% m�todo 1:
N=size(X,2)
med=mean(X);


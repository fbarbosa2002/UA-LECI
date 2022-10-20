%   Distribuicao Binomial 
%   ex6a
%   Em media cada 1 000 chips sai 1 defeituoso
%   Probabilidade de sair 7 defeituosos em 8 000 chips

n = 8000 ;
p = 0.001;
lambda = 8;
k = 7 ;
p7 = ((lambda ^ k) / factorial(k)) * exp( -lambda) 


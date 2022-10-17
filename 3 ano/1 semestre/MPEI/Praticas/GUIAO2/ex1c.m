%ex3
N = 1000000;

exp = rand(2,N) > 0.5;

exp1 = sum(exp)==2;

exp2 = sum(exp) >=1;

exp11 = sum(exp1)/N;

exp22 = sum(exp2)/N;

expfinal = exp11 /exp22

% valor teorico = 1/3

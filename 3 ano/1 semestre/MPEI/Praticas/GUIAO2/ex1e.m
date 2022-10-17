%ex5

N = 1000000;

exp = rand(5,N) >0.5;

exp1 = sum(exp) >= 1;

exp2 = sum(exp) == 2;

exp11 = sum(exp1) / N;

exp22 = sum(exp2) / N;

expfinal = exp22 / exp11  
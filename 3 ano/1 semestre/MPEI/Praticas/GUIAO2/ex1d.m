%ex4
N = 1000000;

exp = rand(1,N) > 0.5;

expfinal = exp == 1;

result = sum(expfinal) / N


%valor teorico = 0.5

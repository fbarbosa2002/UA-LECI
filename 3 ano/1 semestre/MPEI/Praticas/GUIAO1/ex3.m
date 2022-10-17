%ex3
N=100;

experiencias = rand(15,N);

lancamento = experiencias > 0.5;

result = sum(lancamento)>=6;

resultfinal = sum(result)/100;

resultemperc = resultfinal*100


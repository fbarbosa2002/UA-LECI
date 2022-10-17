%ex1

N = 6;

experiencias = rand(3,N);
lancamento = experiencias > 0.5;

resultados = sum(lancamento);

aux = resultados == 2;

resultadofinal = sum(aux)/6;

resulperc = resultadofinal * 100
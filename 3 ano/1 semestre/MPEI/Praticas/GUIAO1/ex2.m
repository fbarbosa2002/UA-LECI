%ex2
N=10e6;
experiencia2 = rand(15,N);

lancamento = experiencia2 >0.5;

resulexper = sum(lancamento)== 6;

resultfinal= sum(resulexper)/N

resultemperc=resultfinal*100
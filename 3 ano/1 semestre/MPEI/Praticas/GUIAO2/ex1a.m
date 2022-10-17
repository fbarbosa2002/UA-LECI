%ex1

N = 100000;

experiencia = rand(2,N) > 0.5;

resultado = sum(experiencia) >= 1;

resfinal = sum(resultado)/N

N = 1000;
i_min = 6;
i_max  = 20;
T = 1000 ;
palavras = generate(N,i_min,i_max,symbol) ;
hashcodes = zeros(size(palavras)) ;
num_atribuicao = zeros(1,T) ;
ncolisoes = 0 ;
tic
for i = 1:N

    hash = string2hash(palavras{i}) ;
    hash = rem(hash,T) + 1 ;
    
    hashcodes(i) = hash ;
    num_atribuicao(hash) = num_atribuicao(hash) + 1 ;

    ncolisoes = ncolisoes + sum(num_atribuicao(hash) > 1) ;
    fprintf(1,"%s-> %d\n",palavras{i},hash) ; 
    fprintf("Numero de atribuições: %d\n\n",(num_atribuicao(hash)))

end
fprintf("Numero de colisoes: %d\n",ncolisoes)
fprintf("Tempo de processamento: %f seconds\n",toc)



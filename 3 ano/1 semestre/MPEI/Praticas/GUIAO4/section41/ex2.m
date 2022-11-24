hashstring = string2hash("Hello") ;

N = 10;
i_min = 6;
i_max  = 20;
T = 100 ;
palavras = generate(N,i_min,i_max,symbol) ;
hashcodes = zeros(size(palavras)) ;
num_atribuicao = zeros(1,T) ;
ncolisoes = 0 ;
for i = 1:N

    hash = string2hash(palavras{i}) ;
    hash = rem(hash,T) + 1 ;
    hashcodes(i) = hash ;
    num_atribuicao(hash) = num_atribuicao(hash) + 1 ;

    ncolisoes = ncolisoes + sum(num_atribuicao(hash) > 1) ;
    fprintf(1,"%s-> %d\n",palavras{i},hash) ; 
end
fprintf("\nNumero de colisoes: %d\n",ncolisoes)



function cell_array_string = generate(N,i_min,i_max,symbol)
    
    comprimento_string  = randi([i_min,i_max],1,N) ;    % comprimento de N strings entre i_min e i_max
    cell_array_string = cell(N,1);
    for loop = 1:N
        num_ger = randi([1,length(symbol)],1,comprimento_string(loop));    % gera matriz entre 1 e tamanho do symbol para o tamanho da string pretendido
        string = symbol(num_ger);                      % passa os numeros da matriz para letras
        cell_array_string{loop} = string ;
        fprintf(" Comprimento da string numero %d: %d\nString: %s\n",loop,comprimento_string(loop),cell_array_string{loop})
    end
end

function hash=string2hash(str,type)

    str=double(str);
    if(nargin<2), type='djb2'; end
    switch(type)
        case 'djb2'
            hash = 5381*ones(size(str,1),1); 
            for i=1:size(str,2), 
                hash = mod(hash * 33 + str(:,i), 2^32-1); 
            end
        case 'sdbm'
            hash = zeros(size(str,1),1);
            for i=1:size(str,2), 
                hash = mod(hash * 65599 + str(:,i), 2^32-1);
            end
        otherwise
            error('string_hash:inputs','unknown type');
    end
end


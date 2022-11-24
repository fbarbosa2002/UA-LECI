% alinea a)

% geracao de N palavras aleatoriamente

% input :   N - nr chaves 
%           i_min
%           i_max
%           symbol
%           [p]

N = 10;
i_min = 6;
i_max  = 20;
symbol = ['a':'z' 'A':'Z' '0':'9'] ;

fprintf("Alinea a):\n")
cell_array_string = generate(N,i_min,i_max,symbol);

%disp(cell_array_string)


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



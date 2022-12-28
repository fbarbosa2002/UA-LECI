% Function to generate keys
function cell_array_string = generate(N,i_min,i_max,symbol,probs)
    
    comprimento_string  = randi([i_min,i_max],1,N) ;    % comprimento de N strings entre i_min e i_max
    cell_array_string = cell(N,1);
    
    for loop = 1:N
        if nargin == 5
            
            aux = zeros(1,comprimento_string(loop)) ;
            rn = rand(1,comprimento_string(loop)) ;   
            for i=1: comprimento_string(loop)
                aux(i) = 1 + sum(rn(i) > cumsum(probs)) ;    
            end
            string = symbol(aux) ;
            cell_array_string{loop} = string ;
            
        else

            num_ger = randi([1,length(symbol)],1,comprimento_string(loop));    % gera matriz entre 1 e tamanho do symbol para o tamanho da string pretendido
            string = symbol(num_ger);                      % passa os numeros da matriz para letras
            cell_array_string{loop} = string ;
    
        end
        fprintf(" Comprimento da string numero %d: %d\nString: %s\n",loop,comprimento_string(loop),cell_array_string{loop})

    end
end
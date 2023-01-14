
% alinea a 
a = [0.2 0.3 0.1 0.45] ;
T = [0 0 0 0 0 0
     0.2 0 0 0 0 0
     0 0 0 0.45 0.3 0
     0 0 0.1 0 0.7 0
     0.8 1 0.9 0 0 0
     0 0 0 0.55 0 1]

% alinea b
% percurso mais pequeno 1 - 5 - 4 - Meta

T2 = T(5,1) * T(4,5) * T(6,4)

% alinea c 

N = 100;
i_min = 6;
i_max  = 10;
symbol = ['a':'z'] ;
k = 5 ;

palavras = generate(N,i_min,i_max,symbol) ;

for i = 1:N
    BF = insert(palavras{i},BF,k) ;
end
counter_positives = 0 ;

for i = 1:N
    
    check_member = verify(palavras{i},BF,k) ;

    if check_member
        counter_positives = counter_positives + 1 ;
    end

end

disp(counter_positives)


% ex2 c)
n = 10000 ;
BF = Init(n) ;

function check_member = verify(elem,BF,k)
    n = length(BF) ;
    check_member = true ;
    for i = 1:k
        
        elem = [elem num2str(i)] ;
        h = string2hash(elem) ;
        h = mod(h,n) + 1;
        
        if ~BF(h)
            check_member = false ;
            break;
        end
    end
end

% Funcoes dadas pelos professores
function BF= Init(n)
    BF= zeros(n,1);
end

function BF = insert(elem,BF,k)
    n = length(BF) ;
    for i = 1:k
        elem = [elem num2str(i)] ;
        h = string2hash(elem) ;
        h = mod(h,n) + 1;
        BF(h) = true ;
    end
end


function cell_array_string = generate(N,i_min,i_max,symbol,probs)
    
    
    cell_array_string = cell(N,1);
    
    for loop = 1:N
        num = rand() ;
            if num < 0.4
                comprimento_string  = 6 ;
            else 
                comprimento_string  = 10 ;  
        
            end
        if nargin == 5
            
            aux = zeros(1,comprimento_string) ;
            rn = rand(1,comprimento_string) ;   
            for i=1: comprimento_string
                aux(i) = 1 + sum(rn(i) > cumsum(probs)) ;    
            end
            string = symbol(aux) ;
            cell_array_string{loop} = string ;
            
        else

            num_ger = randi([1,length(symbol)],1,comprimento_string);    % gera matriz entre 1 e tamanho do symbol para o tamanho da string pretendido
            string = symbol(num_ger);                      % passa os numeros da matriz para letras
            cell_array_string{loop} = string ;
    
        end

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

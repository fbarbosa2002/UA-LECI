
load database

menu_input = -1 ;
while menu_input ~= 5
    id_input = -1 ;

    while id_input < 1 || id_input > 1682
        id_input = input("Insert film ID(1 to 1682): ") ;
    end

    fprintf("1 - Users that evaluated current movie\n")
    fprintf("2 - Suggestion of users to evaluate movie\n")
    fprintf("3 - Suggestion of users to based on common interests\n")
    fprintf("4 - Movies feedback based on popularity\n")
    fprintf("5 - Exit\n")
    menu_input = input("Select choice: ") ;
    
    if menu_input == 1
        ex1(id_input,dict,Nf,Set)
    elseif menu_input == 2
        ex2(Nf,MinHash,id_input,Set,dict)
    elseif menu_input == 3
        fprintf("Function 3\n")
    elseif menu_input == 4
        ex4(MinHashSig,films_dic)
    elseif (menu_input > 5 || menu_input < 1) 
        fprintf("Invalid input\n")
    end
    
end

function ex1(id,dict,Nf,Set)
    fprintf("O filme %d foi avaliado por: \n", id) ;
    % percorrer todos os filmes 
    for i = 1:Nf
        % Quando o id corresponder percorre o Set com os users que ja viram
        % esse filme
        if i == id
            users = Set{i} ;
            total_users = length(users) ;
            for j = 1:total_users
                fprintf("%d -> %s %s\n",users(j),dict{users(j),2},dict{users(j),3})
            end
        end
    end
end

function ex2(Nf,MinHash,id_input,Set,dict)
    
    h = waitbar(0,'Calculating') ;
    min_distance = inf(2,1) ;
    simusers = zeros(2,1) ;
    for n1 = 1:Nf
        waitbar(n1/Nf,h)
        if n1 == id_input
            continue
        end
        distance = sum(MinHash(n1,:) ~= MinHash(id_input,:)) / Nf ;
        
        if distance < min_distance(1)
            min_distance(2) = min_distance(1) ;
            min_distance(1) = distance ;

            simusers(2) = simusers(1) ;
            simusers(1) = n1 ;
        end
    end
    
    aux = unique([Set{simusers(1)}; Set{simusers(2)}]) ;

    for i = 1:length(aux)
        if ~ismember(aux(i),Set{id_input})
            fprintf("%d -> %s %s\n",aux(i),dict{aux(i),2},dict{aux(i),3})
        end
    end
end

function ex4(MinHashSig, dicFilms)
    str = lower(input('\nSearch for a film: ', 's'));
    shingle_size = 4;  
    K = size(MinHashSig, 2);
    threshold = 0.99; 

    % Estrutura de cell array para os shingles
    shinglestring = {};
    for i = 1:length(str) - shingle_size + 1
        aux = str(i:i+shingle_size-1);
        shinglestring{i} = aux;
    end

    % criar MinHash para os shingles
    MinHashString = inf(1,K);
    for j = 1:length(shinglestring)
        chave = char(shinglestring{j});
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave, 127);
        end
        MinHashString(1,:) = min([MinHashString(1,:); hash]);
    end

    % calcular a Distância de Jaccard
    distJ = ones(1, size(dicFilms,1)); 
    h = waitbar(0,'Calculating');
    for i=1:size(dicFilms, 1)  
        waitbar(i/K, h);
        distJ(i) = sum(MinHashSig(i,:) ~= MinHashString)/K;
    end
    delete(h);
    
    flag = false;  
    for i = 1:3
        [val, pos] = min(distJ);  
        if (val <= threshold)  
            flag = true;
            fprintf('ID: %d, nome: %s -> %f\n',pos, dicFilms{pos, 1},val);
        end
        distJ(pos) = 1;  
    end
    
    if (~flag)
        fprintf('No movies found.\n');
    end
    fprintf('\nPress enter to continue');

    
end
udata=load('u.data');   % Carrega o ficheiro dos dados dos filmes
                        % Fica apenas com as duas primeiras colunas

u= udata(1:end,1:3); 
usersids_films = udata(1:end,1:2) ;
dict = readcell('users.txt','Delimiter',';') ;

films_dic = readcell('film_info.txt','Delimiter','\t') ;
clear udata;

    % Lista de filmes
films = unique(u(:,2));     % Extrai os IDs dos filmes
Nf= length(films);          % Nu´mero de filmes

% Constro´i a lista de filmes para cada utilizador

Set= cell(Nf,1); % Usa ce´lulas

for n = 1:Nf % Para cada utilizador
    % Obte´m os filmes de cada um
    ind = find(u(:,2) == films(n));
    % E guarda num array. Usa ce´lulas porque utilizador tem um nu´mero 
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,1)];
end





k = 100 ;
MinHash = inf(Nf,k) ;

for i = 1:Nf
    actual_film = Set{i} ;
    length_actual_film = length(actual_film) ;
    
    for j = 1: length_actual_film
        % correr as funcoes de dispersao
        chave = char(actual_film(j)) ;
        hash = zeros(1,k);
        for a = 1:k
            chave = [chave num2str(a)];
            hash(a) = DJB31MA(chave,127);
        end
        MinHash(i,:) = min([MinHash(i,:);hash]) ;
    end
end

shingle_size=3;
K = 100;  % Número de funções de dispersão
MinHashSig = inf(length(films_dic),K);
for i = 1:length(films_dic)
    conjunto = lower(films_dic{i,1});
    shingles = {};
    for j= 1 : length(conjunto) - shingle_size+1  % Criacao dos shingles para cada filme
        shingle = conjunto(j:j+shingle_size-1);
        shingles{j} = shingle;
    end

    for j = 1:length(shingles)
        chave = char(shingles(j));
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave,127);
        end
        MinHashSig(i,:) = min([MinHashSig(i,:);hash]);  % Valor minimo da hash para este shingle
    end
end



save database.mat usersids_films Set Nf films dict MinHash films_dic MinHashSig
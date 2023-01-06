file = fopen("wordlist-preao-20201103.txt","r") ;
file = textscan(file,"%s") ;
dict = file{1,1} ;
% Tamanho do filtro
n = 8000 ;
% Quantidade de funçoes de dispersao
k = 3 ;
% Tamanho do conjunto
m = 1000 ;

BF = initialize(n);

for i = 1:m
    BF = insert(dict{i},BF,k) ;
end

counter_positives = 0 ;

for i = 1:m
    
    check_member = verify(dict{i},BF,k) ;

    if check_member
        counter_positives = counter_positives + 1 ;
    end

end

fprintf("%d\n",counter_positives)
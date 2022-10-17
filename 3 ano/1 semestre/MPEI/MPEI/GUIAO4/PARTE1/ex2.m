load keysA.m;
Nchaves = length(keysA);
Ntabela = 5e5;
codigos = zeros(1, Nchaves);
tabela = zeros(1,Ntabela);
colisoes = 0;
tic
for i = 1:Nchaves
    hash = string2hash(keysA{i});
    hash = mod(hash,Ntabela) + 1
    codigos(i) = hash;
    if tabela(hash) > 0
        colisoes = colisoes +1
    end
    tabela(hash) = tabela(hash) +1
end

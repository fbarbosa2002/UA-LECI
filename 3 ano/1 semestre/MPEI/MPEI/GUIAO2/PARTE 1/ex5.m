exp = 1e5;

n = 2;

lancamentos = randi([1,6],exp,n);

%A) soma igual a 9
favoraveis = sum((lancamentos')) == 9;
prob = sum(favoraveis)/exp;

display(prob);

%B) segundo valor é par
favoraveis2 = mod(lancamentos(:,2),2) == 0;
prob = sum(favoraveis2)/exp;

display(prob);

%C) pelo menos um dos valores é 5
favoraveis = ismember(lancamentos,[5]);
favoraveis = sum((favoraveis')) >= 1;
prob = sum(favoraveis)/exp;

display(prob);

%D) nenhum dos valores é igual a 1
favoraveis = ismember(lancamentos,[1]);
favoraveis = sum((favoraveis')) == 0;
prob = sum(favoraveis)/exp;

display(prob);
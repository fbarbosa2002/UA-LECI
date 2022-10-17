file= fopen('wordlist-preao-20201103.txt','r');
dict = textscan(file,'%s');
fclose(file);
display(dict);
dict = dict{1,1};
dict = str(dict)

%filtro de bloom
n = 1e3
BF = Start(n);
BF = Insert(BF,dict,3);
display(BF);



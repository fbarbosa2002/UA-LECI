%A)
n = 20;
T = rand(n);
T = T./sum(T);


%B)
%apos 2 transiçoes
T2 = T^2;
display(T2(20,1));

%apos 5 transiçoes
T5 = T^5;
display(T5(20,1));

%apos 10 transiçoes
T10 = T^10;
display(T10(20,1));

%apos 100 transiçoes
T100 = T^100;
display(T100(20,1));


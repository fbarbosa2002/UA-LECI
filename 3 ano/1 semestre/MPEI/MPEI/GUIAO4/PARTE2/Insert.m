function Bfilter = Insert(Bfilter, elements, k)
    N = length(Bfilter);
    for i = 1:length(elements)
        chave = elements(i);
        %calcular os k hashes para cada elemento
        for j = i:k
            chave = [chave  num2str(j)];
            h = DJB31MA(chave,127);
            h = mod(h,n) + 1;
            Bfilfter(h) = true;
        end
    end
end
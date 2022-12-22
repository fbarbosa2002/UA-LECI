function J = calc_distance(Set,Nu)
%% Calcula a distaˆncia de Jaccard entre todos os pares pela definic¸a˜o.

    J=zeros(Nu,Nu); % array para guardar distaˆncias
    h= waitbar(0,'Calculating');
    for n1= 1:Nu,
        waitbar(n1/Nu,h);
        for n2= n1+1:Nu,
            u1 = Set(n1 , :) ;
            u2 = Set(n2 , :) ;
            
    
            nI = length(intersect(u1,u2)) ;
            nU = length(union(u1,u2)) ;
            dJ = 1 - nI / nU ;
            J(n1,n2) = dJ ;
        %% Adicionar co´digo aqui
        end
    end
    
    delete (h)
end
function  SimilarUsers = pares(J,Nu,users,threshold)

    SimilarUsers= zeros(1,3);
    k= 1;
    if margin < 3
    threshold =0.4 ;% limiar de decisao
    end
    % Array para guardar pares similares (user1, user2, distancia)
    

    for n1= 1:Nu
        for n2= n1+1:Nu
            distancia = J(n1,n2) ;
            if distancia <= threshold
                SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
                k= k+1;
            end
        end
    end
end

[Set,Nu,users] = ler_dados('u.data') ;
J = calc_distance(Set,Nu) ;
SimilarUsers = pares(J,Nu,users,0.4) ;
images(J)
%% Com base na distaˆncia, determina pares com
%% distaˆncia inferior a um limiar pre´-definido


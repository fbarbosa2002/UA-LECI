
load database

disp(Set{1682})
menu_input = -1 ;

while menu_input ~= 5
    id_input = -1 ;

    while id_input < 1 || id_input > 1682
        id_input = input("Insert film ID(1 to 1682): ") ;
    end

    fprintf("1 - Users that evaluated current movie\n")
    fprintf("2 - Suggestion of users to evaluate movie\n")
    fprintf("3 - Suggestion of users to based on common interests\n")
    fprintf("4 - Movies feedback based on popularity\n")
    fprintf("5 - Exit\n")
    menu_input = input("Select choice: ") ;
    
    if menu_input == 1
        ex1(id_input,dict,Nf,Set)
    elseif menu_input == 2
        fprintf("Function 2\n")
    elseif menu_input == 3
        fprintf("Function 3\n")
    elseif menu_input == 4
        fprintf("Function 4\n")
    elseif (menu_input > 5 || menu_input < 1) 
        fprintf("Invalid input\n")
    end
    
end

function ex1(id,dict,Nf,Set)
    
    
    fprintf("O filme %d foi avaliado por: \n", id) ;
    for i = 1:Nf
        if i == id
            users = Set{i} ;
            total_users = length(users) ;
            for j = 1:total_users
                fprintf("%d -> %s %s\n",users(j),dict{users(j),2},dict{users(j),3})
            end
            
        end
        
    end
end

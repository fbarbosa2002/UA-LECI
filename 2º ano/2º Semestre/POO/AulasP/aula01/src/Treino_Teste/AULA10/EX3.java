package Treino_Teste.AULA10;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.ArrayList;

public class EX3 {
    public static void main(String[]args){
        Scanner sc= new Scanner(System.in);

        Map<Character,ArrayList<Integer>> map= new HashMap<>();

        System.out.print("Frase: ");
        String s= sc.nextLine();

        for(int i=0; i<s.length();i++){
          char c=s.charAt(i);
          map.put(c, new ArrayList<>());

        }

        for(int i=0;i<s.length();i++){
            char c=s.charAt(i);
            map.get(c).add(i);
            
        }
        System.out.print(map.toString());
        sc.close();
    }
}

package Treino_Teste.AULA10;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

public class EX1 {
    public static void main (String[]args){
        Map<String,String> map= new HashMap<>();
        map.put("branco","Que tem cor de neve");
        map.put("vermelho","Que tem a cor do sangue");
        map.put("rosa","Que e a cor preferida das meninas");
        map.put("preto","Que tem a cor do escuro");
        Set<Entry<String,String>> set= map.entrySet();

        for(Entry<String,String> entry: set){
            System.out.println("O " + entry.getValue() + " e o " + entry.getKey() );
        }


        map.remove("branco");


    }
}

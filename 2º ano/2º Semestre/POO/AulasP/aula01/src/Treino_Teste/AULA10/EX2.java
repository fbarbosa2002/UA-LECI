package Treino_Teste.AULA10;

import java.util.TreeMap;
import java.util.Map;

import java.util.ArrayList;
import java.util.Arrays;

public class EX2 {
    public static void main(String[]args){
        Map<String,ArrayList<String>> map= new TreeMap<>();
        map.put("branco",new ArrayList<String>(Arrays.asList("Que tem cor de neve")));
        map.put("vermelho",new ArrayList<String>(Arrays.asList("Que tem a cor do sangue")));
        map.put("rosa",new ArrayList<String>(Arrays.asList("Que e a cor preferida das meninas")));
        map.put("preto",new ArrayList<String>(Arrays.asList("Que tem a cor do escuro")));
        map.get("preto").add("que e a cor mais escura");
       
       // for(Entry<String,ArrayList<String>> entry: set){
         //   System.out.println("O " + entry.getValue() + " e o " + entry.getKey() );
        //}
        System.out.println(map.toString());

        map.remove("branco");
    }
}

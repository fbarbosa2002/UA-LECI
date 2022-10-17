package aula10;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class ex_2 {
    public static void main(String[] args) {
        TreeMap<String, LinkedList<String>> hM = new TreeMap<>();
        // Add elements
        hM = insertElements("branco", "Que tem a cor de neve", hM);
        hM = insertElements("azul", "Que tem a cor do céu", hM);
        hM = insertElements("vermelho", "Que tem a cor do sangue", hM);
        hM = insertElements("verde", "Que tem a cor das plantas", hM);
        hM = insertElements("amarelo", "Que tem a cor do sol", hM);
        hM = insertElements("amarelo", "Que tem a cor do fogo", hM);        

        System.out.println("LinkedList everything");
        System.out.println(hM.toString() + "\n");

        System.out.println("LinkedList key-value");
        // Getting a Set of Key-value pairs
        Set entrySet = hM.entrySet();
        // Obtaining an iterator for the entry set
        Iterator it = entrySet.iterator();
        while(it.hasNext()){
            Map.Entry me = (Map.Entry)it.next();
            System.out.println("Key is: " + me.getKey() + " & " + " value is: " + me.getValue());
        }
        System.out.println(); // break line

        System.out.println("LinkedList keys");
        it = entrySet.iterator();
        while(it.hasNext()){
            Map.Entry me = (Map.Entry)it.next();
            System.out.println(me.getKey());
        }
        System.out.println(); // break line

        System.out.println("LinkedList values");
        it = entrySet.iterator();
        while(it.hasNext()){
            Map.Entry me = (Map.Entry)it.next();
            System.out.println(me.getValue());
        }
        System.out.println();

        System.out.println("Get random element");
        System.out.println(getRandomValue(hM, "amarelo").toString());
        
    }

    public static TreeMap<String, LinkedList<String>> insertElements(String key, String value, TreeMap<String, LinkedList<String>> hM){
        if(hM.containsKey(key)){
            LinkedList<String> list = hM.get(key);
            list.add(value);
            hM.replace(key, list);
        }else{
            LinkedList<String> list = new LinkedList<>();
            list.add(value);
            hM.put(key, list);
        }
        return hM;
    }

    public static String getRandomValue(TreeMap<String, LinkedList<String>> hM, String key){
        if(!hM.containsKey(key)) return null;
        LinkedList<String> list = hM.get(key);
        int rand = (int) (Math.random() * (list.size()));
        return list.get(rand);
    }

}

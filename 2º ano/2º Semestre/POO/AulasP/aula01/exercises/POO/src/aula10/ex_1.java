package aula10;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class ex_1 {
    public static void main(String[] args) {
        HashMap<String, String> hM = new HashMap<>();
        // Add elements
        double startTime = System.nanoTime(); // clock snapshot before
        hM = insertElements(hM);
        double stopTime = System.nanoTime(); // clock snapshot after
        double delta = (startTime-stopTime)/1e6; // convert to milliseconds
        System.out.println("Took " + delta + " mill to insert " + hM.size() + " elements");

        // Update elements
        startTime = System.nanoTime();
        hM.replace("azul", "Que tem a cor do mar");
        stopTime = System.nanoTime();
        System.out.println("Took " + delta + " mill to update 1 element");

        // Remove elements
        startTime = System.nanoTime();
        hM.remove("amarelo");
        stopTime = System.nanoTime();
        System.out.println("Took " + delta + " mill to remove 1 element");

        System.out.println("List everything");
        System.out.println(hM.toString() + "\n");

        System.out.println("List key-value");
        // Getting a Set of Key-value pairs
        Set entrySet = hM.entrySet();
        // Obtaining an iterator for the entry set
        Iterator it = entrySet.iterator();
        while(it.hasNext()){
            Map.Entry me = (Map.Entry)it.next();
            System.out.println("Key is: " + me.getKey() + " & " + " value is: " + me.getValue());
        }
        System.out.println(); // break line

        System.out.println("List keys");
        it = entrySet.iterator();
        while(it.hasNext()){
            Map.Entry me = (Map.Entry)it.next();
            System.out.println(me.getKey());
        }
        System.out.println(); // break line

        System.out.println("List values");
        it = entrySet.iterator();
        while(it.hasNext()){
            Map.Entry me = (Map.Entry)it.next();
            System.out.println(me.getValue());
        }
    }

    public static HashMap<String, String> insertElements(HashMap<String, String> hM){
        hM.put("branco", "Que tem a cor de neve");
        hM.put("azul", "Que tem a cor do céu");
        hM.put("vermelho", "Que tem a cor do sangue");
        hM.put("verde", "Que tem a cor das plantas");
        hM.put("amarelo", "Que tem a cor do sol");
        return hM;
    }
}



package aula10;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import java.util.Map.Entry;

public class ex_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        LinkedHashMap<Character, ArrayList<Integer>> list = new LinkedHashMap<>();
        String text = readStringValue("Sentence: ", sc);
        for(int i = 0; i < text.length(); i++){
            addCharacter(list, text.charAt(i), i);
        }
        System.out.println();
        System.out.print("{");
        Set<Entry<Character, ArrayList<Integer>>> entrySet = list.entrySet();
        Iterator<Entry<Character, ArrayList<Integer>>> it = entrySet.iterator();
        while(it.hasNext()){
            var me = (Map.Entry)it.next();
            System.out.print(", " + me.getKey() + "=" + me.getValue().toString());
        }
        System.out.println("}");
    }

    public static void addCharacter(LinkedHashMap<Character, ArrayList<Integer>> list, char c, int index){
        if(list.containsKey(c)){
            ArrayList<Integer> array = list.get(c);
            array.add(index);
            list.replace(c, array);
        }else{
            ArrayList<Integer> array = new ArrayList<>();
            array.add(index);
            list.put(c, array);
        }
        
    }

    public static String readStringValue(String message, Scanner sc){
        System.out.print(message);
        return sc.nextLine();
    }
}

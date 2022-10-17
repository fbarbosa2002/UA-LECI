package aula11.ex_1;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Dictionary;
import java.util.Set;
import java.util.TreeMap;

public class ex_1 {
    public static void main(String[] args) {
        final String symbols = "\t\n.,:'‘’;?!-*{}= +&/()[]”“\"\'";
        final char[] separator = symbols.toCharArray();

        TreeMap<String, TreeMap<String, Integer>> dictionary = new TreeMap<>();
        dictionary = readFile(dictionary, "./src/aula11/ex_1/major.txt", separator);

        //get all keys
        Set<String> keys = dictionary.keySet();

        System.out.println("Printing all keys of TreeMap");
        for(String key : keys){
            System.out.println(key + ": " + dictionary.get(key));
        }
    }

    public static TreeMap<String, TreeMap<String, Integer>> readFile(
        TreeMap<String, TreeMap<String, Integer>> dict, String path,
        char[] separator
    ){
        assert path != null;

        try (BufferedReader fileReader = new BufferedReader(new InputStreamReader(
            new FileInputStream(path),
            StandardCharsets.UTF_8))){
            int c;
            boolean separatorFound = false;
            StringBuilder strBuilder = new StringBuilder();
            String lastKey = null;
            while((c = fileReader.read()) != -1){
                char character = (char) c;
                separatorFound = false;
                for(int i = 0; i < separator.length; i++){
                    if(character == separator[i]){ // add until separator
                        separatorFound = true;
                        String current = strBuilder.toString().toLowerCase();
                        if(current.length() >= 3){
                            if(!dict.containsKey(current)){
                                dict.put(current, new TreeMap<String, Integer>());
                            }
                            else if(lastKey != null){
                                var tempMap = dict.get(lastKey);
                                if(tempMap.containsKey(current))
                                    tempMap.replace(current, (tempMap.get(current) + 1));
                                else
                                    tempMap.put(current, 1);
                                dict.replace(lastKey, tempMap);    
                                
                            }
                            lastKey = current;
                        }
                        strBuilder.setLength(0);
                    }
                }
                if(!separatorFound)
                strBuilder.append(character);
            }

        }catch(IOException x ) {
            System.err.printf("IO Exception caught %s\n", x.getMessage());
            return null;
        }catch(Exception e){
            System.err.printf("Exception caught %s\n", e.getMessage());
            return null;
        }

        return dict;
    }
}

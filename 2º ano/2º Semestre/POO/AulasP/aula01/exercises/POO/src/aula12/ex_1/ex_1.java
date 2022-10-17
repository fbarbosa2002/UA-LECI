package aula12.ex_1;

import java.io.File;
import java.util.LinkedList;
import java.util.Scanner;

public class ex_1{
    public static void main(String[] args) {
        int[] words = readFile("./src/aula12/major.txt");

        System.out.println("Número Total de Palavras: " + words[0]);
        System.out.println("Número de palavras repetidas: " + words[1]);
        System.out.println("Número de Diferentes Palavras: " + (words[0] - words[1]));
    }

    public static int[] readFile(String path){
        assert path != null;
        File fin = new File(path);
        assert !fin.isDirectory();

        LinkedList<String> list = new LinkedList<>();
        int[] result = new int[2];
        try (Scanner sc = new Scanner(fin)) {
            while(sc.hasNext()){
                String word = sc.next();
                result[0]++;
                if(list.contains(word))
                    result[1]++;
                else
                    list.add(word);
            }
        } catch (Exception e) {
            System.err.println("Exception caugh: " + e.getMessage());
        }

        return result;
    }
    
}
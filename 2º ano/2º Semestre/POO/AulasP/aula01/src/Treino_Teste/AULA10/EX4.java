package Treino_Teste.AULA10;
import java.util.ArrayList;
import java.util.Scanner;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

public class EX4 {
    public static void main(String[]args) throws IOException{
        List<String> lista= new ArrayList<String>();
        
        Scanner input = new Scanner(new FileReader("words.txt"));
        while (input.hasNext()) {
            String word = input.next();
            if(word.length()>2){
                lista.add(word);
            }
            System.out.println(word);
        }

        for(String string : lista){
            if(string.charAt(string.length()-1)=='s'){
                System.out.print(string);
            }
        }

    }
}

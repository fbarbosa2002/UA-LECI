package Treino_Teste.AULA12;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;
import java.util.Scanner;
public class ex1 {
    public static void main(String[]args) throws IOException{
        Scanner input=null;
        String word="";
        int num_palavras=0,dif_palavras=0;
        
        try{
            input= new Scanner(new FileReader("words.txt"));

        }catch(FileNotFoundException e){
            System.out.println("Ficheiro nao existente");
        }
        LinkedList<String> lista= new LinkedList<String>();
        while(input.hasNextLine()){
            word = input.next();
            num_palavras++;
            if(lista.contains(word)){
                dif_palavras++;
            }else{
                lista.add(word);
            }

        }
        System.out.println("Numero total de palavras: " + num_palavras);
        System.out.print("Numero de palavras iguais: "+ dif_palavras);

        
    }
}

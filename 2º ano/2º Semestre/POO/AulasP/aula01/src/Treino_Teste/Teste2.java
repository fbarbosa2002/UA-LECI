package Treino_Teste;
import java.util.*;
import java.io.*;

public class Teste2 {
    public static void main(String[] args) throws IOException{
    //---------------------------------------------------------------------------------------------------------
        //Ler de um ficheiro //

        File x = new File("path desde src até o nome do ficheiro");
        Scanner y = new Scanner(x);

        //Caso dê dados em uma tabela com identação tab:
        while(y.hasNextLine()){
            String line = y.nextLine();            
            String[] split =line.split("\t"); // cada elemento do array será uma palavra da linha                                   
        }


    //---------------------------------------------------------------------------------------------------------
        // Escrever em ficheiro //

        FileWriter fw = new FileWriter("path desde src até o nome do ficheiro"); // caso ficheiro não exista, cria automaticamente.
        PrintWriter pw = new PrintWriter(fw);
        pw.println("texto");


    //----------------------------------------------------------------------------------------------------------
        // Collection //

        // Set -> sem repetição, sem ordem
        // List -> com repetição, com ordem
        // Map -> <chave,valor>

        ArrayList<Object> al= new ArrayList<>();// -> Array dinamico
        HashSet<Object> hs = new HashSet<>();// -> elemento a ser inserido deve ter função equals.
        TreeSet<Object> ts = new TreeSet<>();// -> Ordenação dos elementos pela sua ordem natural. Objetos deve implementar classe Comparable.
        HashMap<Object,Object> hm = new HashMap<>();// ->  keySet()- Set de keys
        //              values()- Collection de values
        //  Para obter um value de um Map tendo a própria chave do map:
        //  map.get(map.keySet().toArray()[index do elemento]).
        //  . Não possui ordenação nos pares
        TreeMap<Object,Object> tm = new TreeMap<>();// -> Pares ordenados com base na chave (orem natural)

    //----------------------------------------------------------------------------------------------------------    
        // Enum //
        
        /*public enum classeX{
           AAAA,BBBB,VVVV 
        }*/
        // uso : classeX c = ClasseX.AAAA;
        // valueOf(String val) -> converte o elemento do conjunto para um valor
        // ordinal() -> posição na lista de elementos(usando o value); 
        
    
    
    }
}

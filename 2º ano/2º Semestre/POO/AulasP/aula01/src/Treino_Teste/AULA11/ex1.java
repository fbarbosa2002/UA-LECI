package Treino_Teste.AULA11;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

public class ex1 {
    public static void main(String[] args ) throws IOException{
         Scanner words= new Scanner(new FileReader("voos.txt"));
         Scanner compainha= new Scanner( new FileReader("companhias.txt"));

         HashMap<String,String> compainhas= new HashMap<String,String>();
         ArrayList<String> hora= new ArrayList<String>();
         ArrayList<String> voo= new ArrayList<String>();
         ArrayList<String> origem= new ArrayList<String>();
         ArrayList<String> atraso= new ArrayList<String>();

        while(compainha.hasNextLine()){
            String line= compainha.nextLine();
            String [] split = line.split("\t");

            if(split[1].equals("Compainha")){}else{
                compainhas.put(split[0],split[1]);
            }
        }

        while(words.hasNextLine()){

            String line=words.nextLine();
            String[] split= line.split("\t");

            if(split[0].equals("Hora")){} else{
                hora.add(split[0]);
                voo.add(split[1]);
                origem.add(split[2]);
                atraso.add(split[2]);
            }
        }


        FileWriter fw = new FileWriter("file.txt");
        PrintWriter pw = new PrintWriter(fw);

        for(int i=0;i<hora.size();i++){
            pw.println(new Voo(hora.get(i),voo.get(i),compainhas.get(voo.get(i).substring(1)),origem.get(i),atraso.get(i)));
        }

         pw.close();
    }
}

package Treino_Teste.AULA12;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.Set;

public class ex2 {
    public static void main(String[] args) throws IOException{
        LinkedList<Movie> movies= new LinkedList<>();

        Scanner input= new Scanner(new FileReader("movies.txt"));

        input.nextLine();

        while(input.hasNextLine()){
            String [] line = input.nextLine().split("\t");

            movies.add(new Movie(line[0],Double.parseDouble(line[1]), line[2],line[3],Integer.parseInt(line[4])));
        }
        movies.sort(Comparator.comparing(Movie::getScore).reversed());
        for(Movie movie: movies){
            System.out.println(movie);
        }

        Set<String> genres= new HashSet<>();

        for(Movie movie: movies){
            genres.add(movie.getGenre());
        }

        for(String s: genres){
            System.out.println(s);
        }
        FileWriter file= new FileWriter("myselection.txt");
        PrintWriter pw = new PrintWriter(file);

        for(Movie m: movies){
            if(m.getScore()>60){
                pw.println(m);
                System.out.print(m.toString());
            }
        }
        pw.close();

       




    }

}

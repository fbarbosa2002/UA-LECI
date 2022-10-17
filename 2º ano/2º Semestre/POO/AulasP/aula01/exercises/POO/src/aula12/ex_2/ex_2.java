package aula12.ex_2;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

public class ex_2 {
    public static void main(String[] args) {
        List<Movie> moviesList = readFile("./src/aula12/ex_2/movies.txt");
        
        System.out.println("List the structure ");
        System.out.println(moviesList.toString());

        System.out.println("\nList ordered DESC by score");
        moviesList.sort(Comparator.comparing(Movie::getScore).reversed());
        listList(moviesList);

        System.out.println("\nList ordered CRES by running time");
        moviesList.sort(Comparator.comparing(Movie::getTime));
        listList(moviesList);

        Set<String> genres = new HashSet<>();
        for(Movie m:moviesList)
            genres.add(m.getGenre());
        
        System.out.println("\nList Genres: ");
        for(String g:genres){
            System.out.println(g);
        }

        writeFile(moviesList, "./src/aula12/ex_2/myselection.txt");

    }

    public static void writeFile(List<Movie> moviesList, String path){
        if(moviesList == null || path == null) return;

        try {
            File fout = new File(path);
            PrintWriter pW = new PrintWriter(fout);
            for(Movie m:moviesList){
                if(m.getGenre().equals("comedy"))
                    pW.println(m);
            }
            pW.close();
        } catch (Exception e) {
            System.out.println("Exception caught: " + e.getMessage());
        }
    }

    public static void listList(List<Movie> moviesList){
        for(Movie movie:moviesList){
            System.out.println(movie);
        }
    }

    public static List<Movie> readFile(String path){
        List<Movie> list = new LinkedList<>();
        assert path != null;
        try (Scanner reader = new Scanner(new InputStreamReader(
            new FileInputStream(path),
            StandardCharsets.UTF_8))){
            reader.nextLine();  // Skip the header
            while(reader.hasNextLine()){
                String[] line = reader.nextLine().split("\t");
                list.add(new Movie(line[0], 
                    Double.parseDouble(line[1]),
                    line[2],
                    line[3],
                    Integer.parseInt(line[4])));
            }
            reader.close();
        } catch (Exception e) {
            System.err.println("Exception caught: " + e.getMessage());
            return null;
        }
        return list;
    }
}

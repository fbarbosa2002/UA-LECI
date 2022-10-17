package aula10;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Scanner;

public class ex_4 {
    public static void main(String[] args) throws FileNotFoundException {
        Scanner input = new Scanner(new FileReader("./src/aula10/words.txt"));
        var list = new LinkedList<String>();
        while (input.hasNext()) {
            String word = input.next();
            if(word.length() > 2)
                list.add(word);
        }
        System.out.println("\nListar todas terminadas em 's':");
        for (String element: list) {
            if(element.endsWith("s"))
                System.out.println(element);
        }

        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            if (!it.next().matches("[a-zA-Z]+")) {
                it.remove();
            }
        }

        System.out.println("\nLista sem as palavras com dígitos");
        for(String elements: list)
            System.out.println(elements);

    }
}

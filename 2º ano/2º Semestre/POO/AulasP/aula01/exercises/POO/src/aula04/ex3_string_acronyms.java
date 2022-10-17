/** Read a sentence ao show its acronyms. Take into account, that
 * word with size inferior to 3, don't count.
 * Example: Universidade de Aveiro -> UA
 */

package aula04;

import java.util.Scanner;
import java.util.InputMismatchException;

public class ex3_string_acronyms {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String sentence = read_value("Input the name: ", sc), acro = "";
        String[] names = sentence.split("\\s");
        for(int i = 0; i < names.length; i++){
            if(names[i].length() >= 3)
                acro += names[i].charAt(0);
        }
        acro = acro.toUpperCase();
        System.out.printf("The acronym is: %s \n", acro);
        sc.close();
    }

    public static String read_value(String message, Scanner sc) {
        String value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextLine();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        return value;
    }
}

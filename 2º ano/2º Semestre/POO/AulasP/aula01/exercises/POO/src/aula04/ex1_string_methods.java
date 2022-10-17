/** Read a string and perform multiple operations.
 * convert to lower case;
 * show the last character of the string;
 * show the first 3 characters;
 * check the results with 3 more string functions.
 */

package aula04;

import java.util.Scanner;
import java.util.InputMismatchException;

public class ex1_string_methods {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String text = read_value("Input the string: ", sc);
        String lower_case = text.toLowerCase();
        char last_char = text.charAt(text.length()-1);
        String first_three = text.substring(0,3); // [0,3[

        System.out.printf("Lower Cased string: %s. Confirmation %b \n", lower_case, text.equalsIgnoreCase(lower_case));
        System.out.printf("Last character: %c. Confirmation: %b \n", last_char, text.endsWith(String.format("%c", last_char)));
        System.out.printf("First 3 characters: %s. Confirmation: %b \n", first_three, text.startsWith(first_three));

        sc.close();
    }

    public static String read_value(String message, Scanner sc) {
        String value;
        while (true){
            try {
                System.out.print(message);
                value = sc.next();
                if(value.isEmpty() || value.length() < 3) // Minimum of 3 characters
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        return value;
    }
}

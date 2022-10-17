/** Read a sentence and compute the following operations:
 * Count the numeric characters;
 * Count the spaces;
 * Inform if it only has lower case letters;
 * trim excessive spaces;
 * verify if a string is palindrome
 */

package aula04;

import java.util.Scanner;
import java.util.InputMismatchException;

public class ex2_string_operations {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String sentence = read_value("Input the sentence: ", sc);
        System.out.println("Number of digits: " + countDigits(sentence, 0));
        System.out.println("Number of spaces: " + countSpaces(sentence));
        if (countSpaces(sentence) >= 2) {
            System.out.println("Sentence with double or more spaces removed: " + removeDoubleSpaces(sentence));   
        }
        System.out.println(palindrome(sentence) ? "The sentence is a palindrone" : "The sentence isn't a palindrome");

        sc.close();
    }
    /** Return true if sentence is palindrome, else false */
    public static boolean palindrome(String sentence) {
        if(sentence.length() <= 1)
            return true;

        if(sentence.charAt(0) == sentence.charAt(sentence.length()-1))
            return palindrome(sentence.substring(1, sentence.length()-1));
        else
            return false;
    }

    /** Return the number of Integers in a String */
    public static int countDigits(String sentence, int matches){
        if(sentence.length() == 0)
            return matches;
        // ascii values for digits are [48,57]
        return countDigits(sentence.substring(0,sentence.length()-1), 
        ((sentence.charAt(sentence.length()-1)) >= 48 && (sentence.charAt(sentence.length()-1)) <= 57)? ++matches : matches);
    }
    /** Return the number of spaces in a string */
    public static int countSpaces(String sentence){
        return sentence.length() - sentence.replaceAll("\\s+", "").length();
    }
    /** Remove all the double or more followed spaces, and replace them with only one space */
    public static String removeDoubleSpaces(String sentence) {
        return sentence.replaceAll("\\s+", " ");
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

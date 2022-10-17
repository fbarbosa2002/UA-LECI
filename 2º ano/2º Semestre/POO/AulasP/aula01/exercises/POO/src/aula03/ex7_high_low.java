/** The high or low game consists in guessing a natural
 * number between 1 and 100. The program chooses a random 
 * value and gives feedback to the user.
 * In the end, the program should prompt the user to continue
 * playing.
 */

package aula03;

import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

public class ex7_high_low {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String run = "Sim";
        Random rng = new Random();
        int sNumber = rng.nextInt(100) + 1, guesses = 0;
        System.out.println("#*#*#*#*# Welcome to the guessing number game #*#*#*#*#");
        do{
            guesses = 0;
            while(true){
                int guess = read_value("Give it a try: ", sc);
                guesses++;
                if(guess > sNumber)
                    System.out.println("Too High");
                else if(guess < sNumber){
                    System.out.println("Too low");
                }else
                    break;
            }
            System.out.printf("Congratulation, you guessed, taking %d attempts \n", guesses);
            run = read_text("Do continue playing type 'S' or 'Sim': ", sc);
            System.out.println(run);
        }while(run.equals("Sim") || run.equals("S"));
        System.out.println("Game over!");
    }

    public static int read_value(String message, Scanner sc) {
        int value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextInt();
                if(value < 1 || value > 100) // positive value only
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        return value;
    }

    public static String read_text(String message, Scanner sc) {
        String value;
        while (true){
            try {
                System.out.print(message);
                value = sc.next();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        return value;
    }
}

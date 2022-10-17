/* Check if a number is prime. To be a prime number, it has to only
be possible to divide the number by 1 and itself.
*/

package aula03;

import java.util.Scanner;
import java.util.InputMismatchException;

public class ex3_prime_number {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int number = read_value("Input the number: ", sc), divs = 0;
        
        for(int i = 1; i <= number; i++)
            divs = (number / i == (double) number / i) ? divs + 1 : divs ;
        
        System.out.println((divs == 2) ? "The number is prime" : "The number isn't prime");
        sc.close();
    }
    public static int read_value(String message, Scanner sc) {
        int value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextInt();
                if(value <= 0) // positive value only
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

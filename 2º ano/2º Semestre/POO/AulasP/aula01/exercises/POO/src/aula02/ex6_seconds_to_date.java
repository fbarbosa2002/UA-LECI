/* Program that transforms a value in seconds to a date type
 in the format hh:mm:ss (utilize %)
*/

package aula02;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ex6_seconds_to_date {
    public static void main(String[] args) {
        int value = 0;
        Scanner sc = new Scanner(System.in);
        while (true){
            try {
                System.out.print("Input the amount of seconds: ");
                value = sc.nextInt();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.next(); // Flush the bad input
            }

        }
        
        System.out.printf("The seconds introduced correspond to %d:%d:%d ", value/3600, (value%3600)/60, (value%3600)%60);
        sc.close();
    }

}

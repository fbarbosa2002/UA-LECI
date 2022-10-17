/* Given a rectangle triangle with sides A, B and 
 C (hipotenuse). Calculate and show the C side or
 hipotenuse and the value of the angle formed by A
 and C.

*/

package aula02;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ex8_pitagoras {
    public static void main(String[] args) {
        double a, b;
        Scanner sc = new Scanner(System.in);
        a = read_value("Triangle A side: ", sc);
        b = read_value("Triangle B side: ", sc);
        double c = Math.sqrt(Math.pow((double) a, 2) + Math.pow((double) b, 2));
        System.out.printf("The C side or hipotenuse is %5.2f \n", c);
        System.out.printf("The angle formed by A and C is %5.2f º \n", Math.toDegrees(Math.acos(a/c)));
        sc.close();
    }
    public static double read_value(String message, Scanner sc) {
        double value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextDouble();
                if(value <= 0)
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

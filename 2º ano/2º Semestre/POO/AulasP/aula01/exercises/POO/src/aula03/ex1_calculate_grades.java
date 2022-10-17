/* Calculate the final grade of a student, upon reading his
grade for the practical and theoretical component.

*/

package aula03;

import java.util.Scanner;
import java.util.InputMismatchException;

public class ex1_calculate_grades {
    public static void main(String[] args) {
        double t, p;
        Scanner sc = new Scanner(System.in);
        t = read_value("Theoretical grade: ", sc);
        p = read_value("Practical grade: ", sc);
        if(t < 7.0 || p < 7.0){
            System.out.println("Final grade: 66(reproved by minimum grade)");
            return;
        }
        System.out.printf("Final grade: %2.0f", (0.4 * t) + (0.6 * p));
        sc.close();
    }

    public static double read_value(String message, Scanner sc) {
        double value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextDouble();
                if(value < 0 || value >  20) // values in the interval [0...20]
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

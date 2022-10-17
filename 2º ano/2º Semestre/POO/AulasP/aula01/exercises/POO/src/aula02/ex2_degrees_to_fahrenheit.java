// Read a double value in degrees and converts to fahrenheit, 
// using the formula: F = 1.8 * C + 32

package aula02;
import java.util.Scanner;
import java.util.InputMismatchException;

public class ex2_degrees_to_fahrenheit {
    public static void main(String[] args) {
        double degrees;
        Scanner sc = new Scanner(System.in);
        while (true){
            try {
                System.out.print("Input the temperature in degrees: ");
                degrees = sc.nextDouble();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        System.out.printf("The temperature in fahrenheit is %5.2f %n", (1.8 * degrees) + 32);

        sc.close();
    }
}

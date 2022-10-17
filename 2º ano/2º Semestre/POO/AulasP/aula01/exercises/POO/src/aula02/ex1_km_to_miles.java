// Read a floating point value representing the distance in kilometers
// and output the distance in miles

package aula02;
import java.util.InputMismatchException;
import java.util.Scanner;

public class ex1_km_to_miles {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double km;
        while (true){
            try {
                System.out.print("Input the distance in Kilometers: ");
                km = sc.nextDouble();
                if(km < 0)
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }

        System.out.printf("The distance in miles is %5.2f %n", km/1.609);

        sc.close();
    }

}

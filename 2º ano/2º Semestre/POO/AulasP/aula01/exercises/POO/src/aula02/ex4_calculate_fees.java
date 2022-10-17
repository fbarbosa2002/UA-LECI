/* Calculate the fees. Read the initial invested capital
 and the monthly fee rate and output the amount of money 
 over a 3 month period.
 Ex: Capital: 5000, monthly rate: 1%, amount = 5151.505 euros

*/

package aula02;

import java.util.Scanner;
import java.util.InputMismatchException;

public class ex4_calculate_fees {
    public static void main(String[] args) {
        double capital, rate;
        Scanner sc = new Scanner(System.in);
        while (true){
            try {
                System.out.print("\nInput the invested capital: ");
                capital = sc.nextDouble();
                if(capital < 0)
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        while (true){
            try {
                System.out.print("Input the monthly rate: ");
                rate = sc.nextDouble();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        System.out.printf("The money over a 3 month period will be %5.3f %n", calculate_interest(capital, rate, 0, 3));
        
        sc.close();
    }

    public static double calculate_interest(double amount, double rate, int strDepth, int endDepth) {
        if(strDepth == endDepth) return amount;

        return calculate_interest(amount + (amount * (rate*0.01)), rate, ++strDepth, endDepth);
    }
}

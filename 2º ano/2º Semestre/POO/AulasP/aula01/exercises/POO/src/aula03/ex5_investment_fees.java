/* Calculate the amount of money earned on an investment that has a monthly
 earning rate. Read the amount(mutiple of 1000) and the monthly rate (0% - 5%).
 Print the monthly value in the next 12 months.

*/

package aula03;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ex5_investment_fees {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double amount = read_value("Input the investment amount: ", sc, 'a');
        double rate = read_value("Input the interest amount: ", sc, 'r');

        System.out.println(); //break line;
        
        for(int i = 1; i <= 12; i++){
            amount = amount + (amount * (rate*0.01));
            System.out.printf("Month %d: %6.2f \n", i, amount);
        }
        sc.close();
    }

    public static double read_value(String message, Scanner sc, char type) {
        double value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextDouble();
                if(((type == 'a') && ((value <= 0) || (value % 1000 != 0))) || 
                ((type == 'r') && (value < 0 || value > 5)))
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

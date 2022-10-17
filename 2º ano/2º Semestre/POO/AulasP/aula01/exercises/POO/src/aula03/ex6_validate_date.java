/* Read a date and if its valid, output the number of days of the month.
 (dont forget leap years)
*/

package aula03;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ex6_validate_date {
    
    /** year dimensions of a common year. */
    private static final int[] commonDays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
    /** year dimensions of a leap year */
    private static final int[] leapDays = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int month = read_value("Input the month: ", sc, 1, 12);
        int year = read_value("Input the year: ", sc, 0, Integer.MAX_VALUE);

        if(month < 1 || month > 12){
            System.out.println("Invalid Date");
            return;
        }
        System.out.printf("The days of the respective month and year are %d \n", monthDays(month, year));
        sc.close();

    }
    /** evalute if it's a leap year */
    public static boolean leap(int ano) {
        return ano % 4 == 0 && ano % 100 != 0 || ano % 400 == 0;
    }

    /** returns the number of days of a given month. */
    public static int monthDays(int mes, int ano) {
        if(leap(ano)) {
            return leapDays[mes-1];

        }else{
            return commonDays[mes-1];
        }
    }

    public static int read_value(String message, Scanner sc, int min_val, int max_value) {
        int value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextInt();
                if(value < min_val || value > max_value)
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

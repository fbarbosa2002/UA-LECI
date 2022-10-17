/** Read a date composed by month, year and day that the month starts
 * (1 = monday, 2 = tuesday, 3 = wednesday, 4 = thursday, 5 = Friday, 6 = Saturday, 7 = Sunday)
 * and draws the months calendar on the screen. Use three functions, read values, month and day calculations
 * and prints the data
 *  
    February 2019
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28
*/

package aula04;

import java.util.Scanner;
import java.util.InputMismatchException;

public class ex4_calendar {

    /** year dimensions of a common year. */
    private static final int[] commonDays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    /** year dimensions of a leap year */
    private static final int[] leapDays = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    /** year name */
    private static final String[] monthName = {"January", "February", "March", "April", "May", "June", 
        "July", "August", "September", "October", "November", "December"};

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int month = read_value("Input the month: ", sc, 1, 12);
        int year = read_value("Input the year: ", sc, 1, Integer.MAX_VALUE);
        int day = read_value("Input the start day: ", sc, 1, 7);
        
        print_calendar(day, month, year);

        sc.close();
    }
    public static void print_calendar(int day, int month, int year) {
        int total_days = monthDays(month, year);
        System.out.printf(" %10s %4d \n", monthName[month-1], year);
        System.out.println("Su Mo Tu We Th Fr Sa");
        int aux = (day == 7) ? 7 : 0, days = 1;
        for(int l = 0; l < ((day+total_days)/7) + 1; l++){
            for(int c = 0; c < 7; c++){
                if(aux++ < day)
                    System.out.print("   ");
                else if(days <= total_days)
                    System.out.printf("%2d ", days++);
            }
            System.out.println();
        }
    }

    public static int read_value(String message, Scanner sc, int min, int max) {
        int value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextInt();
                if(value < min || value > max)
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        return value;
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
}

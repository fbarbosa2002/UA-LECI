/** Teste the date class */

package aula05;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ex_1_date {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        boolean run = true;
        date dt = new date();
        while(run){
            printMenu();
            int option = read_value("Operation? ", sc, 0, 4);
            switch (option) {
                case 0: run = false; break;
                case 1: dt.set(read_value("Input the day: ", sc, 1, 31), read_value("Input the month: ", sc, 1, 12), read_value("Input the year: ", sc, 1, Integer.MAX_VALUE));break;
                case 2: System.out.println("Current date: " + dt.toString()); break;
                case 3: dt.incrementDate(); break;
                case 4: dt.decrementDate(); break;
                default:break;
            }
        }
        sc.close();
    }

    public static void printMenu(){
        System.out.println("Date operations: ");
        System.out.println("1 - create new date");
        System.out.println("2 - show current date");
        System.out.println("3 - increment date");
        System.out.println("4 - decrement date");
        System.out.println("0 - exit");
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
}

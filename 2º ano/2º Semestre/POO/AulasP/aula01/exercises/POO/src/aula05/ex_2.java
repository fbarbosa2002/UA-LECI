package aula05;

import java.util.Scanner;
import java.util.InputMismatchException;

public class ex_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int choice;
        Schedule cal = new Schedule();
        do{
            printMenu();
            choice = read_value("Operation? ", sc, 0, 3);
            switch (choice) {
                case 1: cal.set(read_value("Input the day: ", sc, 1, 12), read_value("Input the year: ", sc, 1, Integer.MAX_VALUE)); ;break;
                case 2: cal.printMonth(read_value("Input the month: ", sc, 1, 12)); break;
                case 3: System.out.println(cal.toString());break;
                default:break;
            }
            System.out.println();
        } while(choice > 0);
        
        sc.close();
    }

    public static void printMenu(){
        System.out.println("Date Operations: ");
        System.out.println("1 - create new calendar");
        System.out.println("2 - print calendar month");
        System.out.println("3 - print calendar");
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

// Read a value and count to 0

package aula03;

import java.util.Scanner;
import java.util.InputMismatchException;

public class ex2_down_counter {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int value = read_value("Value: ", sc);

        for(int i = value; i >= 0; i--)
            System.out.println(i);
        sc.close();
    }
    public static int read_value(String message, Scanner sc) {
        int value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextInt();
                if(value <= 0) // positive value only
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

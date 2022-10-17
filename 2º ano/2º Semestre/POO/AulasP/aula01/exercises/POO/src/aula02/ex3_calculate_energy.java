/* Program that calculates the amount of energy needed to
 heat water. Read the quantity of water M (kg), the intial
 and final temperate (Celsius). Use the formula: 
 Q = M * (finalTemp - initialTemp) * 4184 (Joules)
*/
package aula02;
import java.util.Scanner;
import java.util.InputMismatchException;

public class ex3_calculate_energy {
    public static void main(String[] args) {
        double m, initTemp, finalTemp;
        Scanner sc = new Scanner(System.in);
        while (true){
            try {
                System.out.print("Input the water weight in Kilograms: ");
                m = sc.nextDouble();
                if(m <= 0)
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        while (true){
            try {
                System.out.print("Input the water initial temperature: ");
                initTemp = sc.nextDouble();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        while (true){
            try {
                System.out.print("Input the water final temperature: ");
                finalTemp = sc.nextDouble();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.next(); // Flush the bad input
            }
        }
        System.out.printf("The amount of energy need is %5.2f (Joules) \n", m * (finalTemp - initTemp) * 4184);

        sc.close();
    }
}


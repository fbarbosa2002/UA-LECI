/* Calculate the average between point A and point B. The program
 must read the velocity v1 and v2, as well as distance d1 (start to 1st destination)
 and d2 (1st destination to finish).
 This represents the distance travelled, assuming a linear displacemente.

*/

package aula02;
import java.util.Scanner;
import java.util.InputMismatchException;

public class ex5_average_speed {
    public static void main(String[] args) {
        double v1, v2, d1, d2;
        Scanner sc = new Scanner(System.in);
        v1 = read_value("Input the first measured velocity: ", sc);
        v2 = read_value("Input the last measured speed: ", sc);
        d1 = read_value("Input the first position: ", sc);
        d2 = read_value("Input the last position: ", sc);
        
        double v_med1 = d1/v1, v_med2 = d2/v2;
        System.out.printf("The average speed is %5.3f %n", (d1 + d2) / (v_med1 + v_med2)); 


        sc.close();
    }
    public static double read_value(String message, Scanner sc) {
        double value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextDouble();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        return value;
    }
}

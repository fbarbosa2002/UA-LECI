/* Read a sequence of numbers and stop when a repeated number is introduced.
 Then show the max and min values, average, sum and total number of values.

*/

package aula03;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ex4_values_info {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int[] array = new int[2];
        int pos = 0;
        boolean repeated = false;
        while(!repeated){
            int number = read_value("Input a new number: ", sc);

            for(int i = 0; i <= pos; i++){
                if(array[i] == number){
                    repeated = true;
                    break;
                }
            }

            if(repeated) break; // repeated found, not add the repeated value
            
            array[pos++] = number;

            if(pos == (array.length - 1)){ // array out of space
                int[] aux = new int[array.length * 2]; // create bigger array
                for(int i = 0; i < array.length; i++)
                    aux[i] = array[i]; // copy the values of the old array to the new
                array = aux; // set the old array with the new size
            }
        }
        int max = array[0], min = array[0], sum = 0;
        for(int i = 0; i < pos; i++){
            max = (array[i] > max) ? array[i] : max;
            min = (array[i] < min) ? array[i] : min;
            sum += array[i];
        }
        System.out.println("The max value is: " + max);
        System.out.println("The min value is: " + min);
        System.out.printf("The average is: %d \n", (sum / pos));
        System.out.printf("The Sum is %d and the amount of introduced values are %d \n", sum, pos);

        sc.close();
    }
    public static int read_value(String message, Scanner sc) {
        int value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextInt();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        return value;
    }
}

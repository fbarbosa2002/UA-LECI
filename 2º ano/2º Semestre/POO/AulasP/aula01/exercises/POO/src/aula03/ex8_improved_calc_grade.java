/** Based on the exercise 1, implement a vector array
 * in order to process grades for 16 students.
 * Fill the values with random numbers, in the 0.0 to 20.0
 * range. Finally show the information.
 */

package aula03;

import java.util.Scanner;

import javax.print.event.PrintEvent;

import java.util.InputMismatchException;
import java.util.Random;

public class ex8_improved_calc_grade {
    public static void main(String[] args) {
        Random rng = new Random();
        double[][] table = new double[16][3];
        for(int l = 0; l < table.length; l++){
            for(int c = 0; c < 2; c++)
                table[l][c] = 0.0 + (20.0 - 0.0) * rng.nextDouble();

            double fGrade = (0.4 * table[l][0]) + (0.6 * table[l][1]);

            if(table[l][0] < 7.0 || table[l][1] < 7.0)
                table[l][2] = 66;
            else table[l][2] = fGrade;
        }
        System.out.printf("%8s%8s%8s \n", "NotaT", "NotaP", "Pauta");
        for(int l = 0; l < table.length; l++){
            System.out.printf("%8.1f%8.1f%8d \n", table[l][0], table[l][1], (int) table[l][2]);
        }
        
    }
}

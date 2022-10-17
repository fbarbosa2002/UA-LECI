/*  calculate the distance between two points.
    2D value -> x, y
*/

package aula02;

import java.util.Scanner;
import java.util.InputMismatchException;

public class ex7_distance {
    public static void main(String[] args) {
        Point p1 = new Point();
        Point p2 = new Point();
        Scanner sc = new Scanner(System.in);
        p1.px = read_value("X value point A: ", sc);
        p1.py = read_value("Y value point A: ", sc);
        p2.px = read_value("X value point B: ", sc);
        p2.py = read_value("Y value point B: ", sc);
        
        System.out.printf("The distance is %5.2f", Math.sqrt(Math.pow((p2.px - p1.px),2) + Math.pow((p2.py-p1.py),2)));
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

class Point {
    int px;
    int py;

    public int getPx() {
        return px;
    }

    public int getPy() {
        return py;
    }

    public void setPx(int px) {
        this.px = px;
    }

    public void setPy(int py) {
        this.py = py;
    }
}

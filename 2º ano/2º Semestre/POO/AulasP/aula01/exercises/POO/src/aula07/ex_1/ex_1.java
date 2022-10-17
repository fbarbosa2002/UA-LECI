package aula07.ex_1;

import java.util.Scanner;
import java.util.InputMismatchException;

public class ex_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int choice;
        Forma cir = null;
        Forma tri = null;
        Forma rect = null;
        do{
            printMenu();
            choice = read_intValue("Operation? ", sc, 0, 7);
            System.out.println(); // spacing
            switch (choice) {
                case 1: 
                    tri = new Triangulo(read_doubleValue("Input Side 1 value: ", sc, 0.0, Double.MAX_VALUE), read_doubleValue("Input Side 2 value: ", sc, 0.0, Double.MAX_VALUE), read_doubleValue("Input Side 3 value: ", sc, 0.0, Double.MAX_VALUE), read_stringValue("Input the object color: ", sc)); break;
                case 2: cir = new Circulo(read_doubleValue("Input the radius: ", sc, 0.0, Double.MAX_VALUE), read_stringValue("Input the object color: ", sc)); break;
                case 3: rect = new Retangulo(read_doubleValue("Input the length: ", sc, 0.0, Double.MAX_VALUE), read_doubleValue("Input the height: ", sc, 0.0, Double.MAX_VALUE), read_stringValue("Input the object color: ", sc)); break;
                case 4: 
                    if(tri == null){
                        System.out.println("Triangle not defined");
                        break;
                    }
                    Triangulo compTri = new Triangulo(read_doubleValue("Input Side 1 value: ", sc, 0.0, Double.MAX_VALUE), read_doubleValue("Input Side 2 value: ", sc, 0.0, Double.MAX_VALUE), read_doubleValue("Input Side 3 value: ", sc, 0.0, Double.MAX_VALUE), read_stringValue("Input the object color: ", sc));
                    System.out.println(tri.equals(compTri) ? "Triangles are equal" : "Triangles are not equal");
                    if(!tri.equals(compTri)){
                        if(tri.compareTo(compTri) < 0) System.out.println("Comparable triangle is larger");
                        else System.out.println("Comparable triangle is smaller");
                    }break;
                case 5:
                    if(cir == null){
                        System.out.println("Circle not defined");
                        break;
                    }
                    Circulo compCir = new Circulo(read_doubleValue("Input the radius: ", sc, 0.0, Double.MAX_VALUE), read_stringValue("Input the object color: ", sc));
                    System.out.println(cir.equals(compCir) ? "Circles are equal" : "Circles are not equal");
                    if(!cir.equals(compCir)){
                        if(cir.compareTo(compCir) < 0) System.out.println("Comparable Circles is larger");
                        else System.out.println("Comparable Circles is smaller");
                    }break;
                case 6:
                    if(rect == null){
                        System.out.println("Rectangle not defined");
                        break;
                    }
                    Retangulo compRec = new Retangulo(read_doubleValue("Input the length: ", sc, 0.0, Double.MAX_VALUE), read_doubleValue("Input the height: ", sc, 0.0, Double.MAX_VALUE), read_stringValue("Input the object color: ", sc));
                    System.out.println(rect.equals(compRec) ? "Rectangles are equal" : "Rectangles are not equal");
                    if(!rect.equals(compRec)){
                        if(rect.compareTo(compRec) < 0) System.out.println("Comparable Rectangle is larger");
                        else System.out.println("Comparable Rectangle is smaller");
                    }break;
                case 7: 
                    if(cir != null)
                        System.out.println(cir.toString() + "\n");
                    if(tri != null)
                        System.out.println(tri.toString() + "\n");
                    if(rect != null)
                        System.out.println(rect.toString() + "\n");
                    break;

                default:break;
            }
            System.out.println();
        } while(choice > 0);
        
        sc.close();
    }

    public static void printMenu(){
        System.out.println("\nShape Operations: ");
        System.out.println("1 - create new Triangle");
        System.out.println("2 - Create new Circle");
        System.out.println("3 - Create new Rectangle");
        System.out.println("4 - Compare Triangle");
        System.out.println("5 - Compare Circle");
        System.out.println("6 - Compare Rectangle");
        System.out.println("7 - List all shapes");
        System.out.println("0 - exit\n");
    }

    public static int read_intValue(String message, Scanner sc, int min, int max) {
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

    public static double read_doubleValue(String message, Scanner sc, double min, double max){
        double value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextDouble();
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

    public static String read_stringValue(String message, Scanner sc){
        String value;
        while (true){
            try {
                System.out.print(message);
                value = sc.next();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        return value;
    }

}

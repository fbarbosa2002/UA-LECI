package aula11;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.InputMismatchException;

public class Helpers {

    /** Retrieves an Integer value from the user input
      * @param message Message to show to the user
      * @param sc Scanner object to read the input
      * @param min Minimum value that the user can introduce
      * @param max Max value that the user can introduce
	  * @return the valid value introduced by the user
	  */
    public static int readIntValue(String message, Scanner sc, int min, int max) {
        assert min <= max;

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


    /** Retrieves a Double point value from the user input
      * @param message Message to show to the user
      * @param sc Scanner object to read the input
      * @param min Minimum value that the user can introduce
      * @param max Max value that the user can introduce
	  * @return the valid value introduced by the user
	  */
    public static double readDoubleValue(String message, Scanner sc, double min, double max){
        assert min <= max;

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

    
    /** Retrieves a String value from the user input
      * @param message Message to show to the user
      * @param sc Scanner object to read the input
      * @param min Minimum length for the String
      * @param max Max length for the String
	  * @return the valid value introduced by the user
	  */
    public static String readStringValue(String message, Scanner sc, int min_size, int max_size){
        assert min_size <= max_size;

        String value;
        while (true){
            try {
                System.out.print(message);
                value = sc.next();
                if(value.length() < min_size || value.length() > max_size)
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that -> Hint: try less characters");
                sc.nextLine(); // Flush the bad input
            }
        }
        return value;
    }


    /** Returns the number of lines of results in a file
      * @param fin File object to read the data
	  * @return a number corresponding to the amount of rows
	  */
    public static int fileSize(File fin){
        assert fin != null; // check that the fileName isn't null
        assert fin.isFile(); // check that the file exists

        int rows_number = 0;
		try {
            Scanner sf = new Scanner(fin);
            while (sf.hasNextLine()) {
                sf.nextLine();
                rows_number++;
            }
            sf.close();
        } catch (FileNotFoundException e) {
            System.err.println("ERROR: Exception found : " + e.getMessage());
            return 0;
        }
        return rows_number;
    }
}

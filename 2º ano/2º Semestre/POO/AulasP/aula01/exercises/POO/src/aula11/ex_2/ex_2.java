package aula11.ex_2;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Scanner;

public class ex_2 {
    public static void main(String[] args) {
        LinkedHashMap<String, String> airlines = readAirlines(new File("./src/aula11/ex_2/companhias.txt"));
        LinkedList<Voo> flights = readFlights(new File("./src/aula11/ex_2/voos.txt"), airlines);
        printFlightTable(flights);
        System.out.println();
        System.out.println(writeTableFile(new File("./src/aula11/ex_2/Infopublico.txt"), flights) ? "File saved" : "Error saving file");
    
    }

    public static LinkedHashMap<String, String> readAirlines(File file){
        assert file != null;
        assert file.isFile();

        LinkedHashMap<String, String> airlines = new LinkedHashMap<>();

        try(Scanner fileReader = new Scanner(file)){
            fileReader.nextLine();  // dont read the header
            while(fileReader.hasNextLine()){
                String[] line = fileReader.nextLine().split("\t");
                airlines.put(line[0], line[1]);
            }
        }catch(IOException io){
            System.err.println("Exception caught: " + io.getMessage());
        }
        return airlines;
    }

    public static LinkedList<Voo> readFlights (File file, LinkedHashMap<String, String> airlines){
        assert file != null;
        assert file.isFile();

        var flights = new LinkedList<Voo>();

        try(Scanner fileReader = new Scanner(file)){
            fileReader.nextLine();  // dont read the header
            while(fileReader.hasNextLine()){
                String[] line = fileReader.nextLine().split("\t");
                airlines.putIfAbsent(line[1].substring(0, 2), "Unknown agency");
                Time delay = line.length == 4 ? new Time(line[3]) : new Time(0, 0);
                flights.add(new Voo(new Time(line[0]), 
                    delay, 
                    line[1], 
                    airlines.get(line[1].substring(0,2)),
                    line[2]));
            }
        }catch(IOException io){
            System.err.println("IOException caught: " + io.getMessage());
        }catch(Exception e){
            System.err.println("Exception caught: " + e.getMessage());
        }

        return flights;
    }

    public static boolean writeTableFile(File file, LinkedList<Voo> flights){
        assert file != null;
        assert !file.isDirectory();

        try (PrintWriter pf = new PrintWriter(file)){
            pf.printf("%4s  %8s  %20s  %21s  %5s  %12s\n","Hora","Voo","Companhia","Origem","Atraso","Obs");
            for(Voo f:flights){
                String delay = "";
                if(!f.getDelays().equals(new Time(0,0)))
                    delay = f.getDelays().toString();
                pf.printf("%4s  %8s  %20s  %21s  %4s  %17s\n",
                    f.getTime(), f.getName(), f.getAgency(), f.getOrigin(), delay, f.getObservation());
            }
        } catch (Exception e) {
            System.err.println("Exception caught: " + e.getMessage());
            return false;
        }
        return true;
    }

    public static void printFlightTable(LinkedList<Voo> flights){
        System.out.printf("%4s  %8s  %20s  %21s  %5s  %12s\n","Hora","Voo","Companhia","Origem","Atraso","Obs");
        for(Voo f:flights){
            String delay = "";
            if(!f.getDelays().equals(new Time(0,0)))
                delay = f.getDelays().toString();
            System.out.printf("%4s  %8s  %20s  %21s  %4s  %17s\n",
                f.getTime(), f.getName(), f.getAgency(), f.getOrigin(), delay, f.getObservation());
        }
    }
    
}

package Treino_Teste.AULA05;
import java.util.Scanner;
import java.io.IOException;
public class Test_Calendar {
    public static void main(String[]args) throws IOException{
        Scanner sc= new Scanner(System.in);
        Calendar calendar= new Calendar();
       
       
        boolean running=true;
        int day,year, month;
        while(running){
            printMenu();
            int menu=sc.nextInt();
            switch(menu){

                case 0: //System.exit(0);
                    running=false;
                break;

                case 1:  System.out.print("Dia: \n");
                        day=sc.nextInt();
                        System.out.print("Ano: \n");
                        year=sc.nextInt();
                        calendar.set(year,day);
                break;

                case 2: 
                        System.out.print("Mes do calendario: \n");
                        month=sc.nextInt();
                        
                        System.out.print("Current calendar month: \n");
                        calendar.printmonth(month);        
                break;

                case 3: 

                        System.out.print("Calendario: \n");
                        calendar.showcalendar();
                break;
            }
        }
        sc.close();
        
    }

    public static void printMenu(){
        System.out.print("\n\n\nCalendar operations:\n");
        System.out.print("1 - create new calendar\n");
        System.out.print("2 - print calendar month\n");
        System.out.print("3 - print calendar\n");
        System.out.print("0 - exit\n");
        System.out.print("Digite um numero: ");
    }
}

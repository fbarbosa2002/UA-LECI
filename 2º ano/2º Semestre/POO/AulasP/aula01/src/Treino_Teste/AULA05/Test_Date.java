package Treino_Teste.AULA05;

import java.io.IOException;
import java.util.Scanner;
public class Test_Date {
    public static void main(String[]args) throws IOException{
        Scanner sc= new Scanner(System.in);
        Date date= new Date();
       
       
        boolean running=true;
        int day,month,year;
        while(running){
            printMenu();
            int menu=sc.nextInt();
            switch(menu){

                case 0: //System.exit(0);
                break;

                case 1:  System.out.print("Dia: \n");
                        day=sc.nextInt();
                        System.out.print("Mes: \n");
                        month=sc.nextInt();
                        System.out.print("Ano: \n");
                        year=sc.nextInt();
                        date.set(day, month, year);
                break;

                case 2: 
                        System.out.print("Current date: " + date.toString() + "\n");        
                break;

                case 3: 

                        System.out.print("Data antiga: " + date.toString() + "\n");
                        date.increment();
                        System.out.print("Nova data incrementada: " + date.toString() +"\n");
                break;

                case 4:
                
                    System.out.print("Data antiga: " + date.toString() + "\n");
                    date.decrement();
                    System.out.print("Nova data incrementada: " + date.toString() +"\n");

                break;
            }
        }
        sc.close();
        
    }

    public static void printMenu(){
        System.out.print("Date operations:\n");
        System.out.print("1 - create new date\n");
        System.out.print("2 - show currentt date\n");
        System.out.print("3 - increment date\n");
        System.out.print("4 - decrement date\n");
        System.out.print("0 - exit\n");
        System.out.print("Digite um numero: ");
    }
}

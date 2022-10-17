package Treino_Teste.AULA05;

public class Calendar {
    private int year, dayOfWeek;
    public Calendar(){
        set(year, dayOfWeek);

    }
    public void set(int y, int dow){
        if(dow>0 && dow<8){
            this.year=y;
            this.dayOfWeek=dow;
        }
    }
    public int getYear(){
        return year;
    }
    public int getDayOfWeek(){
        return dayOfWeek;
    }

    public int firstWeekDayofMonth(int month){
        if(month==1){return dayOfWeek;}

        int days=0;

        for(int i=1; i<month; i++){
            days+=Date.MonthDay(i, year);
        }
        days = days % 7 ;

        return  days + getDayOfWeek();
    }
    public void printmonth(int month){
        int counter=0,aux=1;
        int contador=1;
        
        System.out.println();
        System.out.println();
        System.out.println();
        monthtostring(month);
        System.out.print("\t");
        System.out.print(year);
    
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.print("Su\tMo\tTu\tWe\tTh\tFr\tSa\n");
        for(int i=1;i<firstWeekDayofMonth(month);i++){
            System.out.print("\t");
            counter++;
        }
        aux=7-counter;
        while(counter!=7){
            System.out.print(contador +"\t");
            contador++;
            counter++;
        }
        System.out.println();

        for(int i=1;i<=(Date.MonthDay(month, this.year)-aux);i++){
            System.out.print(contador + "\t");
            contador++;
            if(i%7==0){
                System.out.println();
            }
        }
    }
    public void showcalendar(){
        int month=1;
        while(month<13){
            printmonth(month);
            month++;
        }
    }

    public void monthtostring(int month){
        switch(month){
            case 1: System.out.print("Janeiro");
            break;
            case 2:System.out.print("Fevereiro");
            break;
            case 3:System.out.print("Marco");
            break;
            case 4:System.out.print("Abril");
            break;
            case 5:System.out.print("Maio");
            break;
            case 6:System.out.print("Junho");
            break;
            case 7:System.out.print("Julho");
            break;
            case 8:System.out.print("Agosto");
            break;
            case 9:System.out.print("Setembro");
            break;
            case 10:System.out.print("Outubro");
            break;
            case 11:System.out.print("Novembro");
            break;
            case 12:System.out.print("Dezembro");
            break;
        }
    }

}

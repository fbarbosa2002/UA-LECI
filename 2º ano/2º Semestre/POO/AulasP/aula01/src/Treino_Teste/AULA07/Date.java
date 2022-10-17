package Treino_Teste.AULA07;

public abstract class Date{
    protected int day, month,year;
    
    public static boolean validMonth(int month){
        if(month>0 && month<=12){
            return true;
        } else{
            return false;
        }
    }

    public static int MonthDay(int month, int year){
       
        if(month==2 && YearBis(year)){
            return 29;

        } else if(month==2 && !YearBis(year)){
            return 28;

        }  else if(MonthW31Month(month)){
            return 31;

        } else{
            return 30;
        }

    }

    public static boolean YearBis(int year){
        if((year % 400 ==0) || ((year % 4 == 0) && (year % 100 != 0 ))){
            return true;
        } else{
            return false;
        }
    }

    public static boolean MonthW31Month(int month){
        if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12){
            return true;
        }else {
            return false;
        }
    }
    public static boolean valid(int day, int month, int year){
        if(year>0 && validMonth(month) && day<=MonthDay(month, year)){
            return true;
        } else{
            return false;
        }
    }
    
    abstract void increment();
    abstract void decrement();
}

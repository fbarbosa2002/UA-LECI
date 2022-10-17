package Treino_Teste.AULA06;

public class Date {
    private int day;
    private int year;
    private int month;
    
    
    public Date(int day,int month,int year){
        if(valid(day, month, year)){
            this.day=day;
            this.month=month;
            this.year=year;
        }
        }

    public void set(int day, int month, int year){
        if(valid(day, month, year)){
            this.day=day;
            this.month=month;
            this.year=year;
        }
    }

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
    public int getDay(){
        return day;
    }
    
    public int getMonth(){
        return month;
    }
    
    public int getYear(){
        return year;
    }
    
    public void increment(){
        day++;

        if(day==MonthDay(month, year)){
            month++;
            day=1;
            if(month==12){
                month=1;
                year++;
            }
        }
    }

    public void decrement(){
        day--;

        if(day==1){
            month--;
            day= MonthDay(month, year);
            if(month==1){
                year--;
                month=12;
            }
        }

    }

    @Override public String toString(){
        if(!valid(day, month, year)){
            return "Data invalida!";
        }
        return year + " - " + month + " - " + day;
    }

}
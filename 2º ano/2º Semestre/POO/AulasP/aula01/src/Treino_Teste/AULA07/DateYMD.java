package Treino_Teste.AULA07;

public class DateYMD extends Date {
    private int day;
    private int year;
    private int month;
    
    
    public DateYMD(){
        set(day,month,year);
    }

    public void set(int day, int month, int year){
        if(Date.valid(day, month, year)){
            this.day=day;
            this.month=month;
            this.year=year;
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

        if(day==Date.MonthDay(month, year)){
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
            day= Date.MonthDay(month, year);
            if(month==1){
                year--;
                month=12;
            }
        }

    }

    @Override public String toString(){
        if(!Date.valid(day, month, year)){
            return "Data invalida!";
        }
        return year + " - " + month + " - " + day;
    }

}
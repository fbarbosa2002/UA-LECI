package aula07.ex_2;

import java.util.Calendar;

public class DateYMD extends Date {

    /** Default constructor */
    public DateYMD(){
        Calendar today = Calendar.getInstance();
        this.day = today.get(Calendar.DAY_OF_MONTH);
        this.month = today.get(Calendar.MONTH) + 1;
        this.year = today.get(Calendar.YEAR);
    }

    public DateYMD(int d, int m, int y){
        if(valid(d, m, y)){ // only sets the value if its valid
            this.day = d;
            this.month = m;
            this.year = y;
        }
    }

    public void set(int d, int m, int y){
        if(valid(d, m, y)){ // only sets the value if its valid
            this.day = d;
            this.month = m;
            this.year = y;
        }
    }

    public int getDay(){ return day; }
    public int getMonth(){ return month; }
    public int getYear(){ return year; }

    void incrementDate() {    
        day++;
        if(!valid(day, month, year)) {
            month++;
            day = 1;
            if(!valid(day,month,year)) {
                day = 1;
                month = 1;
                year++;
            }
        }
    }

    void decrementDate() {    
        day--;
        if(!valid(day, month, year)) {
            month--;
            day = monthDays(month, year);
            if(!valid(day,month,year)) {
                month = 12;
                day = monthDays(month, year);
                year--;
            }
        }
    }

    @Override
    public String toString(){
        return getYear() + "-" + getMonth() + "-" + getDay();
    }

}

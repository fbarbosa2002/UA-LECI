package aula09.ex_1;

import java.util.Calendar;

public class Date implements Comparable<Date> {
    
    private int day, month, year;

    /** Default constructor */
    public Date(){
        Calendar today = Calendar.getInstance();
        this.day = today.get(Calendar.DAY_OF_MONTH);
        this.month = today.get(Calendar.MONTH) + 1;
        this.year = today.get(Calendar.YEAR);
    }

    public Date(int d, int m, int y){
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

    public static boolean validMonth(int month){
        return (month >= 1 && month <= 12) ? true : false; /** Month in the interval [1,12] */
    }

    /** year dimensions of a common year. */
    private static final int[] commonDays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    /** year dimensions of a leap year */
    private static final int[] leapDays = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    /** evalute if it's a leap year */
    public static boolean leapYear(int ano) {
        return ano % 4 == 0 && ano % 100 != 0 || ano % 400 == 0;
    }

    /** returns the number of days of a given month. */
    public static int monthDays(int month, int year){
        return leapYear(year) ? leapDays[month-1] : commonDays[month-1];
    }

    public static boolean valid(int day, int month, int year){
        return ((day >= 1 && day <= monthDays(month, year)) && validMonth(month)) ? true: false;
    }

    public void incrementDate() {    
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
    public void decrementDate() {    
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

    @Override public boolean equals(Object obj){
        if (this == obj) return true;
        if (obj == null) return false;
        if (!(this.getClass() == obj.getClass())) return false;
        Date d = (Date) obj;
        /** Compare attibutes */
        if (this.getDay() != d.getDay()) return false;
        if (this.getMonth() != d.getMonth()) return false;
        if (this.getYear() != d.getYear()) return false;
        return true;
    }

    @Override public int compareTo(Date date){
        if(this.getYear() < date.getYear()) return -1;
        else if(this.getYear() > date.getYear()) return 1;
        // Year is equal
        if(this.getMonth() < date.getMonth()) return -1;
        else if(this.getMonth() > date.getMonth()) return 1;
        // Month is equal
        if(this.getDay() < date.getDay()) return -1;
        else if(this.getDay() > date.getDay()) return 1;
        else return 0;
    }

    @Override public int hashCode() {
        return ((Integer) getDay()).hashCode() * ((Integer) getMonth()).hashCode() * ((Integer) getMonth()).hashCode();
    }
    @Override public String toString(){
        return "Date: " + year + "-" + month + "-" + day;
    }

}

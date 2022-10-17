package aula05;

import java.util.Calendar;

public class Schedule {
    private int year, week_day;

    /** Default constructor */
    public Schedule(){
        this(Calendar.YEAR, 1);
    }

    public Schedule(int d, int y){
        this.year = y;
        this.week_day = d;
    }

    public void set(int d, int y){
        this.year = y;
        this.week_day = d;
    }
    
    public int getYear(){ return year;}
    public int getFirstWeekdayOfYear(){ return week_day;}

    /** year name */
    private static final String[] monthName = {"January", "February", "March", "April", "May", "June", 
        "July", "August", "September", "October", "November", "December"};

    public int firstWeekdayOfMonth(int month) {
        if(month == 1) return week_day;
        int t_days = 0;
        for(int i = 1; i < month; i++)
            t_days += date.monthDays(i, year);
        
        t_days %= 7; // goes to another week range
        return getFirstWeekdayOfYear() + t_days;
    }

    public void printMonth(int month){
        int total_days = date.monthDays(month, year);
        System.out.printf("\n %10s %4d \n", monthName[month-1], year);
        System.out.println("Su Mo Tu We Th Fr Sa");
        int day = firstWeekdayOfMonth(month), aux = 1, days = 1;
        day = (day > 7) ? day-7 : day;
        for(int l = 0; l < ((day+total_days)/7) + 1; l++){
            for(int c = 0; c < 7; c++){
                if(aux++ < day)
                    System.out.print("   ");
                else if(days <= total_days)
                    System.out.printf("%2d ", days++);
            }
            System.out.println();
        }
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();

        for(int month = 1; month <= 12; month++){
            int total_days = date.monthDays(month, year);
            sb.append(String.format("\n %10s %4d \n", monthName[month-1], year));
            sb.append("Su Mo Tu We Th Fr Sa \n");
            int day = firstWeekdayOfMonth(month), aux = 1, days = 1;
            day = (day > 7) ? day-7 : day;
            for(int l = 0; l < ((day+total_days)/7) + 1; l++){
                for(int c = 0; c < 7; c++){
                    if(aux++ < day)
                        sb.append("   ");
                    else if(days <= total_days)
                        sb.append(String.format("%2d ", days++));
                }
                sb.append("\n");
            }

        }
        return sb.toString();
    }
}

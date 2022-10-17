package aula07.ex_2;

// NOTE: cannot instance abstract classes
public abstract class Date {
    
    protected int day, month, year;

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
        return validMonth(month) && ((day >= 1 && day <= monthDays(month, year))) ? true: false;
    }

    abstract void incrementDate();
    abstract void decrementDate();
    
}

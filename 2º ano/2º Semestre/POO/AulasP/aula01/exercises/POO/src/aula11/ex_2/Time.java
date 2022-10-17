package aula11.ex_2;

public class Time implements Comparable<Time> {
    private int hours, minutes;

    public Time(int hours, int minutes) {
        this.hours = hours;
        this.minutes = minutes;
    }

    public Time(String time){
        try{
            String[] temp = time.split(":");
            this.hours = Integer.parseInt(temp[0]);
            this.minutes = Integer.parseInt(temp[1]);
        }catch(NumberFormatException e){
            System.err.println("Number Format exception: " + e.getMessage());
        }catch(Exception e){
            System.err.println("Exception caught: " + e.getMessage());
        }
    }

    public int getHours() {
        return this.hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public int getMinutes() {
        return this.minutes;
    }

    public void setMinutes(int minutes) {
        this.minutes = minutes;
    }

    public Time hours(int hours) {
        setHours(hours);
        return this;
    }

    public Time minutes(int minutes) {
        setMinutes(minutes);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Time)) {
            return false;
        }
        Time time = (Time) o;
        return hours == time.hours && minutes == time.minutes;
    }

    @Override
    public int compareTo(Time time){
        if(getHours() < time.getHours())
            return -1;
        else if(getHours() > time.getHours())
            return 1;
        else{
            if(getMinutes() < time.getMinutes())
                return -1;
            else if(getMinutes() > time.getMinutes())
                return 1;
            else
                return 0;
        }
    }

    @Override
    public String toString() {
        return (getHours() < 10 ? "0" +  getHours() :  getHours()) + ":" + 
            (getMinutes() < 10 ? "0" +  getMinutes() :  getMinutes());
    }

    public Time add(Time time){
        if(time == null) return this;
        Time result = new Time(0, 0);
        result.setMinutes(getMinutes() + time.getMinutes());
        result.setHours(getHours() + time.getHours() + (result.getMinutes() / 60));
        result.setMinutes(result.getMinutes() % 60);
        return result;
    }

}

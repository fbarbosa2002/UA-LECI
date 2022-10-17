package aula07.ex_2;

public class DateND extends Date {

    private int days;
    private DateYMD dt;

    /** Default constructor */
    public DateND(int ds){
        this.days = ds;
        dt = new DateYMD(1,1,2000);
        if(days > 0){
            for(int i = 0; i < ds;i++){
                dt.incrementDate();
            }
        }else if(days < 0){
            for(int i = ds; i > 0;i--){
                dt.decrementDate();
            }
        }
    }

    public int getDays(){ return days; }

    void incrementDate(){ days++; dt.incrementDate(); }
    void decrementDate(){ days--; dt.decrementDate(); }

    @Override
    public String toString(){
        return "Days: " + getDays() + "; " + dt.toString();
    }
}

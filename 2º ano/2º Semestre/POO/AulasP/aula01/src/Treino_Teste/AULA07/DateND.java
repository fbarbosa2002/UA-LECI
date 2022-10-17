package Treino_Teste.AULA07;

public class DateND extends Date{
    private int ndays;
    private DateYMD Data;
    public DateND(int ndays){
        
        this.ndays=ndays;
        Data.set(1,1,2000);

        if(ndays>0){
            for(int i=0;i<ndays;i++){
                Data.increment();
            }
        } else if(ndays<0){
            for(int i=ndays;i<0;i++){
                Data.decrement();
            }
        }
    }

    public int getDays(){
        return ndays;
    }

    void increment(){
        ndays++;
        Data.increment();
    }

    void decrement(){
        ndays--;
        Data.decrement();
    }





}

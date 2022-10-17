package Treino_Teste.AULA07;

public class Apartamento extends Alojamento{
    private int nrooms;

    public Apartamento(String code,String name,String local, double price,boolean dispon,double aval,int nrooms){
        super(code,name,local,price,dispon,aval);
        if(nrooms>0){
            this.nrooms=nrooms;
        }
    }
    public int getNRooms(){
        return nrooms;
    }
}

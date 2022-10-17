package Treino_Teste.AULA07;

public class QHotel extends Alojamento{
    private String type;

    public QHotel(String code,String name,String local, double price,boolean dispon,double aval,String type){
        super(code,name,local,price,dispon,aval);
        if(type.equals("single") || type.equals("double") || type.equals("triple") || type.equals("twin")){
            this.type=type;
        }
    }

    public String getType(){
        return type;
    }

    public void setType(String type){
        this.type=type;
    }
}

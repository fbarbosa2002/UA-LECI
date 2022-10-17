package Treino_Teste.AULA07;

public abstract class Alojamento {
    private String code;
    private String local;
    private String name;
    private double price;
    private boolean dispon;
    private double aval;
    
    public Alojamento(String code,String name,String local, double price,boolean dispon,double aval){
        this.code=code;
        this.local=local;
        this.name=name;
        
        if(price>0){
            this.price=price;
        }
        if(dispon==true){
            this.dispon=dispon;
        }

        if(aval>0 && aval<=5){
            this.aval=aval;
        }
    }

    public String getCode(){
        return code;
    }
    public String getName(){
        return name;
    }
    public String getLocal(){
        return local;
    }
    public double getprice(){
        return price;
    }

    public boolean dispon(){
        return dispon;
    }

    public double getAval(){
        return aval;
    }
    
    

}

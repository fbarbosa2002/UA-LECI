package Treino_Teste.AULA07;

import java.util.ArrayList;
import java.util.List;
public class AgViagens {
    private String nome;
    private String ender;
    List <Alojamento> aloj= new ArrayList<Alojamento>();
    List <Carro> viaturas= new ArrayList<Carro>();

    public AgViagens(String nome, String ender){
        set(nome, ender);
    }
    public void set( String nome, String ender ){
        this.nome=nome;
        this.ender=ender;
    }
    public void AdicionarViatura(Carro carro){
        this.viaturas.add(carro);

    }
    

    public String getName(){
        return nome;
    }

    public void setName(String nome){
        this.nome=nome;
    }

    public String getEnder(){
        return ender;
    }

    public void setEnder(String ender){
        this.ender=ender;
    }

}

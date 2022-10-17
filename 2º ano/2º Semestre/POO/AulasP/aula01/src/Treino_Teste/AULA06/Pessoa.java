package Treino_Teste.AULA06;

public class Pessoa {
    private String nome;
    private int cc;
    private Date dataNasc;
    
    public Pessoa(String nome, int cc, Date dataNasc){
        this.nome=nome;
        this.cc=cc;
        this.dataNasc=dataNasc;
    }

    public String getName(){
        return nome;
    }

    public int getCC(){
        return cc;
    }

    public Date getDate(){
        return dataNasc;
    }
    
    public void setName(String name){
        this.nome=name;
    }

    public void setCC(int cc){
        this.cc=cc;
    }

    public void setDate(Date dataNasc){
        this.dataNasc=dataNasc;
    }

    @Override public String toString(){
        return nome + " ; CC: " + cc + "; Data de nascimento: " + dataNasc; 
    }

}

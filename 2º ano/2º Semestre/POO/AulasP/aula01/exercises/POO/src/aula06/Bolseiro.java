package aula06;

public class Bolseiro extends Aluno {
    int bolsa;

    public Bolseiro(String iNome, int iBI, Date iDataNasc, Date iDataInsc, int quantia){
        super(iNome, iBI, iDataNasc, iDataInsc);
        this.bolsa = quantia;
    }
    
    public Bolseiro(String iNome, int iBI, Date iDataNasc, int quantia){
        super(iNome, iBI, iDataNasc);
        this.bolsa = quantia;
    }

    public int getBolsa(){ return bolsa; }
    public void setBolsa(int n){ this.bolsa = n;}

    @Override
    public String toString(){
        return super.toString() + ", Bolsa: " + getBolsa();
    }
}

package Treino_Teste.AULA06;

public class Bolseiro extends Aluno {
    private double mont;

    public Bolseiro(String nome, int cc, Date dataNasc, double mont){
        super(nome,cc,dataNasc);
        if(mont>0){
            this.mont=mont;
        }
    }

    public double getBolsa(){
        return mont;
    }

    public void setBolsa(double mont){
        this.mont=mont;
    }

}

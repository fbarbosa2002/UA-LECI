package Treino_Teste.Teste;

public abstract class Activity {
    protected int participants;
    protected double preco;

    public Activity(int participants,double preco) {
        this.participants = participants;
        this.preco=preco;
    }
    
}

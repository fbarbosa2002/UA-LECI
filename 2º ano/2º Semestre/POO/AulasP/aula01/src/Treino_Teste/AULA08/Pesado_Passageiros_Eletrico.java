package Treino_Teste.AULA08;

public class Pesado_Passageiros_Eletrico extends Pesado_Passageiros implements VeiculoEletrico{
    private int cargaeletrica;

    public Pesado_Passageiros_Eletrico(String matricula, String marca, String modelo, int potencia, int peso, int nmax,int cargaeletrica){
        super(matricula, marca, modelo, potencia, peso, nmax);
        this.cargaeletrica=cargaeletrica;
    }

    public int autonomia(){return cargaeletrica;}
    public void carregar(int percentagem){
        cargaeletrica+=percentagem;
    }

}
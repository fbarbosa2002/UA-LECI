package Treino_Teste.AULA08;

public class Pesado_Passageiros extends Viatura {
    private int nmax;
    private int peso;

    public Pesado_Passageiros(String matricula, String marca, String modelo, int potencia, int peso, int nmax){
        super(matricula, marca, modelo, potencia);
        this.peso=peso;
        this.nmax=nmax;
    }

    public int getPeso(){return peso;}
    public void setPeso(int peso){this.peso=peso;}
    public int getNMaxPassageiros(){return nmax;}
    public void setNMaxPassageiros(int nmax){this.nmax=nmax;}

    @Override public String toString(){
        StringBuilder sb= new StringBuilder();
        sb.append("Peso: " +getPeso() +"\n");
        sb.append("Numero maximo de passageiros: " + getNMaxPassageiros() + "\n");
        return sb.toString();
    }

}

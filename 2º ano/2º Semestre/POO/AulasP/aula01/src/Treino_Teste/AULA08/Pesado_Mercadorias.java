package Treino_Teste.AULA08;

public class Pesado_Mercadorias extends Viatura {
    private int peso;
    private int carga;

    public Pesado_Mercadorias(String matricula, String marca, String modelo, int potencia, int peso, int carga){
        super(matricula, marca, modelo, potencia);
        this.peso=peso;
        this.carga=carga;
    }

    public int getPeso(){return peso;}
    public int getCarga(){return carga;}
    public void setPeso(int peso){this.peso=peso;}
    public void setCarga(int carga){this.carga=carga;}
    
    @Override public String toString(){
        StringBuilder sb= new StringBuilder();
        sb.append("Peso: " +getPeso() +"\n");
        sb.append("Numero maximo de carga: " + getCarga() + "\n");
        return sb.toString();
    }
}

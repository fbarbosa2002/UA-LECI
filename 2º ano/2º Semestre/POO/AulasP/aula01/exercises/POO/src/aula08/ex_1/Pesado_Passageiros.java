package aula08.ex_1;

public class Pesado_Passageiros extends Pesado {
    private int max_passageiros;

    public Pesado_Passageiros(String matricula, String marca, String modelo, String numero_quadro, int cilindrada, int peso, int max_passageiros){
        super(matricula, marca, modelo, numero_quadro, cilindrada, peso);
        this.max_passageiros = max_passageiros;
    }

    public int getPeso(){ return peso; }
    public void setPeso(int n){ peso = n; }
    public int getMax_passageiros() { return this.max_passageiros; }
    public void setMax_passageiros(int max_passageiros) { this.max_passageiros = max_passageiros; };

    @Override public boolean equals(Object obj){
        if(!(super.equals(obj))) return false;
        Pesado_Passageiros passageiros = (Pesado_Passageiros) obj;
        return this.getMax_passageiros() == passageiros.getMax_passageiros();
    }

    @Override public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString() + "\n");
        sb.append("Pesado de Passageiros com número máximo de passageiros de " + getMax_passageiros() + "\n");
        return sb.toString();
    }
}

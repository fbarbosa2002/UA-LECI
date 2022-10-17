package aula08.ex_1;

public class Automovel_Ligeiro extends Viatura {
    private String numero_quadro;
    private int capacidade_bagageira;

    public Automovel_Ligeiro(String matricula, String marca, String modelo, String numero_quadro, int cilindrada, int bagageira){
        super(matricula, marca, modelo, cilindrada);
        this.capacidade_bagageira = bagageira;
        this.numero_quadro = numero_quadro;
    }

    public String getNumero_quadro() { return this.numero_quadro; }
    public void setNumero_quadro(String numero_quadro) { this.numero_quadro = numero_quadro; };
    public int getCapacidade_bagageira() { return this.capacidade_bagageira; }
    public void setCapacidade_bagageira(int capacidade_bagageira) { this.capacidade_bagageira = capacidade_bagageira; }
    
    @Override public boolean equals(Object obj){
        if(!(super.equals(obj))) return false;
        Automovel_Ligeiro auto = (Automovel_Ligeiro) obj;
        return this.getCapacidade_bagageira() == auto.getCapacidade_bagageira();
    }

    @Override public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("-> Automovel Ligeiro; Numero de Quadro: " + getNumero_quadro() + "; Capacidade de Bagageira: " + getCapacidade_bagageira() + "\n");
        sb.append(super.toString() + "\n");
        return sb.toString();
    }
    
}

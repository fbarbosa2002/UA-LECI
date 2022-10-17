package aula08.ex_1;

public class Taxi extends Viatura{
    private String numero_quadro;
    private int capacidade_bagageira, licenca;

    public Taxi(String matricula, String marca, String modelo, String numero_quadro, int cilindrada, int bagageira, int licenca){
        super(matricula, marca, modelo, cilindrada);
        this.capacidade_bagageira = bagageira;
        this.licenca = licenca;
        this.numero_quadro = numero_quadro;
    }

    public String getNumero_quadro() { return this.numero_quadro; }
    public void setNumero_quadro(String numero) { this.numero_quadro = numero; };
    public int getLicenca() { return this.licenca; }
    public void setLicenca(int licenca) { this.licenca = licenca; };
    public int getCapacidade_bagageira(){ return this.capacidade_bagageira;}
    public void setCapacidade_bagageira(int capacidade_bagageira){ this.capacidade_bagageira = capacidade_bagageira;}

    @Override public boolean equals(Object obj){
        if(!(super.equals(obj))) return false;
        Taxi taxi = (Taxi) obj;
        if(!(this.getNumero_quadro().equals(taxi.getNumero_quadro()))) return false;
        if(!(this.getLicenca() == taxi.getLicenca())) return false;
        return this.getCapacidade_bagageira() == taxi.getCapacidade_bagageira();
    }

    @Override public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("-> Taxi; Número de Licença: " + getLicenca() + "; Numero de Quadro: " + getNumero_quadro() + "; Capacidade de Bagageira: " + getCapacidade_bagageira() + "\n");
        sb.append(super.toString() + "\n");
        return sb.toString();
    }
}

package Treino_Teste.AULA08;

public class Taxi extends AutomovelLigeiro {
    private int licenca;

    public Taxi(String matricula, String marca, String modelo, int potencia,int bagageira, int licenca){
        super(matricula, marca, modelo, potencia, bagageira);
        this.licenca=licenca;
    }

    public int getLicenca(){return licenca;}
    public void setLicenca(int licenca){this.licenca=licenca;}

    @Override public String toString(){
        StringBuilder sb= new StringBuilder();

        sb.append("Licenca nr: " + getLicenca() + "\n");
        sb.append(super.toString() + "\n");
        return sb.toString();
    }
    
}

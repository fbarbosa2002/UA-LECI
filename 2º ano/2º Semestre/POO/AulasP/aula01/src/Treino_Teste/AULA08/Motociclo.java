package Treino_Teste.AULA08;

public class Motociclo extends Viatura{
    private String tipo;

    public Motociclo(String matricula, String marca, String modelo, int potencia,String tipo){
        super(matricula, marca, modelo, potencia);
        if(tipo.equals("estrada") || tipo.equals("desportivo")){
            this.tipo=tipo;
        }
    }
    public String getTipo(){return tipo;}
    public void setTipo(String tipo){this.tipo=tipo;}

    @Override public String toString(){
        StringBuilder sb= new StringBuilder();
        sb.append("Motociclo tipo: " + getTipo() + "\n");
        sb.append(super.toString() + "\n");
        return sb.toString();
    }
}

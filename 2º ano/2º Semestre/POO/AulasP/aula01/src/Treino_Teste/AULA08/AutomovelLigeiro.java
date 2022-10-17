package Treino_Teste.AULA08;

public class AutomovelLigeiro extends Viatura {
    private int bagageira;

    public AutomovelLigeiro(String matricula, String marca, String modelo, int potencia,int bagageira){
        super(matricula, marca, modelo, potencia);
        if(bagageira>=0){
            this.bagageira=bagageira;
        }
    }

    public int getBagageira(){return bagageira;}
    public void setBagageira(int bagageira){this.bagageira=bagageira;}

    @Override public String toString(){
        StringBuilder sb= new StringBuilder();

        sb.append("Capacidade da bagageira: "+ getBagageira());
        sb.append(super.toString() + "\n");
        return sb.toString(); 
    }
}

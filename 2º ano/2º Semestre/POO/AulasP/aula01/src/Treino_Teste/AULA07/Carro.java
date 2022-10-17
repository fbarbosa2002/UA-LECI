package Treino_Teste.AULA07;

public class Carro {
    private char classe;
    private String gasolType;
    private boolean dispon;

    public Carro(char classe,String gasolType, boolean dispon){
        if(classe=='A' || classe=='B' || classe=='C' || classe=='D' || classe=='E' || classe=='F'){
            this.classe=classe;
        }

        if(gasolType.equals("gasolina") || gasolType.equals("diesel") || gasolType.equals("hibrido") || gasolType.equals("eletrico")){
            this.gasolType=gasolType;
        }

        if(dispon==true){
            this.dispon=dispon;
        }
    }

    public char getClasse(){
        return classe;
    }

    public String getGasolType(){
        return gasolType;
    }

    public boolean getDispon(){
        return dispon;
    }
    
    public void levantarCarro(){
        dispon=false;
    }

    public void EntregarCarro(){
        dispon=true;
    }

}

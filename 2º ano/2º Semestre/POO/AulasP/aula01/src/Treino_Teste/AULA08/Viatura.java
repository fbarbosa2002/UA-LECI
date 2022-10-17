package Treino_Teste.AULA08;

public class Viatura implements KmPercorridos {
    protected String matricula, marca, modelo, nrQuadro;
    protected int potencia,numero_trajetos;
    protected int []trajetos;
    public Viatura(String matricula, String marca, String modelo, int potencia){
        this.matricula=matricula;
        this.marca=marca;
        this.modelo=modelo;
        this.potencia=potencia;
        this.numero_trajetos=0;
        this.trajetos= new int[10];
        this.nrQuadro="";
    }

    public void trajeto(int quilometros){
        trajetos[numero_trajetos++]=quilometros;
    }

    public int ultimoTrajeto(){
        return trajetos[numero_trajetos];
    }

    public int distanciaTotal(){
        int total=0;
        for(int i=0;i<numero_trajetos;i++){
            total+=trajetos[i];
        }
        return total;
    }
    public int getPotencia(){return potencia;}
    public int getNTrajetos(){return numero_trajetos;}
    public String getMatricula(){return matricula;}
    public String getMarca(){return marca;}
    public String getModelo(){return modelo;}

    @Override public String toString(){
        return "Matricula: " + getMatricula() + "\nMarca" + getMarca() + "\nModelo: " + getModelo() + "\nPotencia: " + getPotencia();
    }
    
}

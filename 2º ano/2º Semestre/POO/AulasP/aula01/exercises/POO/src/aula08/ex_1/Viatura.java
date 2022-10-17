package aula08.ex_1;

public abstract class Viatura implements KmPercorridosInterface {
    protected String matricula, marca, modelo, numero_quadro;
    protected int cilindrada, aux_trajetos;
    protected int[] trajetos;

    /** Default constructor */
    public Viatura(String matricula, String marca, String modelo, int cilindrada){
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
        this.cilindrada = cilindrada;
        this.trajetos = new int[10];
        this.aux_trajetos = 0;
        this.numero_quadro = "";
    }

    public String getMatricula(){ return matricula; }
    public String getMarca(){ return marca; }
    public String getModelo(){ return modelo; }
    public int getCilindrada(){ return cilindrada; }

    public void trajeto(int quilometros){
        if(quilometros <= 0) return;
        redimensionar_trajeto();
        trajetos[aux_trajetos++] = quilometros;
    }

    private void redimensionar_trajeto(){
        if(trajetos.length >= aux_trajetos) return;
        int[] aux = new int[trajetos.length + 10];
        for(int i = 0; i < trajetos.length; i++)
            aux[i] = trajetos[i];
        trajetos = aux;
    }

    public int ultimoTrajeto(){
        return trajetos[aux_trajetos];
    }

    public int distanciaTotal(){
        int total = 0;
        for(int i = 0; i < aux_trajetos; i++){
            total += trajetos[i];
        }
        return total;
    }

    @Override public boolean equals(Object obj){
        if (this == obj) return true;
        if (obj == null) return false;
        if (!(this.getClass() == obj.getClass())) return false;
        Viatura v = (Viatura) obj;
        /** Compare attibutes */
        if (!(this.getCilindrada() == v.getCilindrada())) return false;
        if (!(this.getMarca().equals(v.getMarca()))) return false;
        if (!(this.getMatricula().equals(v.getMatricula()))) return false;
        if (!(this.getModelo().equals(v.getModelo()))) return false;
        return true;
    }

    @Override public String toString(){
        return getMatricula() + ": " + getMarca() + " " + getModelo() + " com cilindrada de " + getCilindrada();
    }

}

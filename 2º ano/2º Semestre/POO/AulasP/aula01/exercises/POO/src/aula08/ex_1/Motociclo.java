package aula08.ex_1;

public class Motociclo extends Viatura {
    private String tipo;

    public Motociclo(String matricula, String marca, String modelo, int cilindrada, String tipo){
        super(matricula, marca, modelo, cilindrada);
        if(tipo.toLowerCase().equals("estrada") || tipo.toLowerCase().equals("desportivo"))
            this.tipo = tipo;
        else
            System.out.println("Valor para o tipo de automóvel errado");
    }

    public String getTipo(){ return tipo;}
    public void setTipo(String tipo) { this.tipo = tipo; }

    @Override public boolean equals(Object obj){
        if(!(super.equals(obj))) return false;
        Motociclo moto = (Motociclo) obj;
        return this.getTipo().equals(moto.getTipo());
    }

    @Override public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("-> Motociclo; Tipo: " + getTipo() + "\n");
        sb.append(super.toString() + "\n");
        return sb.toString();
    }
}

package aula08.ex_1;

public abstract class Pesado extends Viatura {
    protected String numero_quadro;
    protected int peso;

    public Pesado(String matricula, String marca, String modelo, String numero_quadro, int cilindrada, int peso){
        super(matricula, marca, modelo, cilindrada);
        if(peso > 0)
            this.peso = peso;
        else
            System.out.println("O atríbuto peso precisa de ser superior a 0");
        this.numero_quadro = numero_quadro;
    }

    public String getNumero_quadro(){ return numero_quadro; }
    public void setNumero_quadro(String numero){ this.numero_quadro = numero; }
    public abstract int getPeso();
    public abstract void setPeso(int n);

    @Override public boolean equals(Object obj){
        if(!(super.equals(obj))) return false;
        Pesado pesado = (Pesado) obj;
        if(!(this.getNumero_quadro().equals(pesado.getNumero_quadro()))) return false;
        return this.getPeso() == pesado.getPeso();
    }

    @Override public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("-> Pesado; Peso: " + getPeso() + "\n");
        sb.append(super.toString());
        return sb.toString();
    }
}

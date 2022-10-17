package aula08.ex_1;

public class Automovel_Ligeiro_Eletrico extends Automovel_Ligeiro implements VeiculoEletrico {
    private int autonomia;

    public Automovel_Ligeiro_Eletrico(String matricula, String marca, String modelo, String numero_quadro, int cilindrada, int bagageira, int autonomia){
        super(matricula, marca, modelo, numero_quadro, cilindrada, bagageira);
        if(autonomia > 0)
            this.autonomia = autonomia;
        else   
            System.out.println("Autonomia tem de ser superior a 0 Quilometros");
    }
    public int autonomia(){ return autonomia; }
    
    public void carregar(int percentagem){
        if (percentagem + autonomia >= 100) {
            autonomia = 100;
        } else {
            autonomia += percentagem;
        }
    }

    @Override public boolean equals(Object obj){
        if (this == obj) return true;
        if (!super.equals(obj)) return false;
        if (getClass() != obj.getClass()) return false;
        Automovel_Ligeiro_Eletrico other = (Automovel_Ligeiro_Eletrico) obj;
        if (autonomia != other.autonomia) return false;
        return true && super.equals(obj);
    }

    @Override public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("Elétrico com autonomia de " + autonomia + "\n");
        return sb.toString();
    }
}

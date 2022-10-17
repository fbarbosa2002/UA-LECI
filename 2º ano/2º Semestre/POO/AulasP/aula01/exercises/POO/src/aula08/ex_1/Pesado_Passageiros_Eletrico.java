package aula08.ex_1;

public class Pesado_Passageiros_Eletrico extends Pesado_Passageiros implements VeiculoEletrico {
    private int autonomia;

    public Pesado_Passageiros_Eletrico(String matricula, String marca, String modelo, String numero_quadro, int cilindrada, int peso, int max_passageiros, int autonomia){
        super(matricula, marca, modelo, numero_quadro, cilindrada, peso, max_passageiros);
        if(autonomia > 0)
            this.autonomia = autonomia;
        else   
            System.out.println("Autonomia tem de ser superior a 0 Quilometros");
    }
    public int autonomia(){ return autonomia; }

    public void carregar(int percentagem){
        if(percentagem <= 0) return;
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
        Pesado_Passageiros_Eletrico other = (Pesado_Passageiros_Eletrico) obj;
        if (autonomia != other.autonomia) return false;
        return true && super.equals(obj);
    }

    @Override public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("Elétrico com autonomia de " + autonomia() + "\n");
        return sb.toString();
    }
}

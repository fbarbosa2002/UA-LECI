package Treino_Teste.AULA11;

public class Voo {
    private String hora,voo,compainha,origem,atraso;

    public Voo(String hora, String voo, String compainha, String origem, String atraso) {
        this.hora = hora;
        this.voo = voo;
        this.compainha = compainha;
        this.origem = origem;
        this.atraso = atraso;
    }
    public String getHora() {
        return hora;
    }

    public String getVoo() {
        return voo;
    }

    public String getCompainha() {
        return compainha;
    }

    public String getOrigem() {
        return origem;
    }

    public String getAtraso() {
        return atraso;
    }
    @Override
    public String toString() {
        return hora+ "\t" + voo+ "\t" + compainha + "\t" + origem + "\t" + atraso;
    }
}

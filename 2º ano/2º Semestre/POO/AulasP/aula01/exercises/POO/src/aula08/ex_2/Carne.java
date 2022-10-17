package aula08.ex_2;

public class Carne extends Alimento {
    private VariedadeCarne variedade;

    public Carne(VariedadeCarne variedade, double proteinas, double calorias, double peso) {
        super(proteinas, calorias, peso);
        this.variedade = variedade;
    }

    public VariedadeCarne getVariedade() { return this.variedade; }
    public void setVariedade(VariedadeCarne variedade) { this.variedade = variedade; }

    @Override
    public String toString() {
        return "";

    }
}
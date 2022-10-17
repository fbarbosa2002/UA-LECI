package aula08.ex_2;

public abstract class Alimento {
    protected double proteinas, calorias, peso;

    public Alimento(double proteinas, double calorias, double peso) {
        this.proteinas = proteinas;
        this.calorias = calorias;
        this.peso = peso;
    }

    public double getProteinas() {return this.proteinas;}
    public void setProteinas(double proteinas) {this.proteinas = proteinas;}
    public double getCalorias() {return this.calorias;}
    public void setCalorias(double calorias) {this.calorias = calorias;}
    public double getPeso() {return this.peso;}
    public void setPeso(double peso) {this.peso = peso;}

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Alimento)) {
            return false;
        }
        Alimento alimento = (Alimento) o;
        return proteinas == alimento.proteinas && calorias == alimento.calorias && peso == alimento.peso;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        long temp;
        temp = Double.doubleToLongBits(calorias);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(peso);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(proteinas);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    @Override
    public String toString() {
        return "{" +
            " proteinas='" + getProteinas() + "'" +
            ", calorias='" + getCalorias() + "'" +
            ", peso='" + getPeso() + "'" +
            "}";
    }
    
    
}

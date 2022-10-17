package aula07.ex_1;

public class Circulo extends Forma {

    private double raio;

    public Circulo(double r, String c){
        if(r > 0)
            this.raio = r;
            cor = c; // Use the abstract color attribute
    }

    public double getRaio(){ return this.raio; }
    public void setRaio(double r){ if(r > 0) this.raio = r;}
    String getCor(){return cor;}

    @Override
    public String toString() {
        return "CIRCLE: Radius: " + this.getRaio() + "\n     " + 
            "Area: " + String.format("%5.2f", this.area()) + "; Perimeter: " + String.format("%5.2f", this.perimeter()) + ";\n";
    }

    @Override
    public boolean equals(Object obj){
        if(!(obj instanceof Circulo) && getClass() != obj.getClass()) return false;
        Circulo c = (Circulo) obj;
        return super.equals(c) && (this.getRaio() == c.getRaio());
    }

    @Override
    public int compareTo(Object obj){
        if (this == obj) return 0;
        if (obj == null || getClass() != obj.getClass()) return -1;

        Circulo c = (Circulo) obj;
        if(this.getRaio() < c.getRaio()) return -1;
        return (this.getRaio() == c.getRaio()) ? 0 : 1;
    }

    double area(){
        return this.getRaio() * Math.PI;
    }

    double perimeter(){
        return this.getRaio() * 2 * Math.PI;
    }
}

package aula05.ex_3;

public class Circulo implements Comparable<Object> {

    private double raio;

    public Circulo(double r){
        if(r > 0)
            this.raio = r;
    }

    public double getRaio(){ return this.raio; }
    public void setRaio(double r){ if(r > 0) this.raio = r;}

    @Override
    public String toString() {
        return "CIRCLE: Radius: " + this.getRaio() + "\n     " + 
            "Area: " + String.format("%5.2f", this.area()) + "; Perimeter: " + String.format("%5.2f", this.perimeter()) + ";\n";
    }

    @Override
    public boolean equals(Object obj){
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;

        Circulo c = (Circulo) obj;
        return (this.getRaio() == c.raio);
    }

    @Override
    public int compareTo(Object obj){
        if (this == obj) return 0;
        if (obj == null || getClass() != obj.getClass()) return -1;

        Circulo c = (Circulo) obj;
        if(this.getRaio() < c.raio) return -1;
        return (this.getRaio() == c.raio) ? 0 : 1;
    }

    public double area(){
        return this.getRaio() * Math.PI;
    }

    public double perimeter(){
        return this.getRaio() * 2 * Math.PI;
    }
}

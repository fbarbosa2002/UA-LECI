package aula07.ex_1;

public class Retangulo extends Forma{
    private double length, height;

    public Retangulo(double length, double height, String c){
        if(length > 0 && height > 0){
            this.length = length;
            this.height = height;
            cor = c; // Use the abstract color attribute
        }
    }

    public void set(double length, double height, String c){
        if(length > 0 && height > 0){
            this.length = length;
            this.height = height;
            cor = c; // Use the abstract color attribute
        }
    }

    public double getLength(){ return length; }
    public double getHeight(){ return height; }
    String getCor(){return cor;}

    @Override
    public String toString() {
        return "RETANGULO: Length: " + getLength() + "; Height: " + getHeight() + "\n     " + 
        "Area: " + String.format("%5.2f", this.area()) + "; Perimeter: " + String.format("%5.2f", this.perimeter()) + ";\n";
    }

    @Override
    public boolean equals(Object obj){
        if(!(obj instanceof Retangulo) && getClass() != obj.getClass()) return false;
        Retangulo r = (Retangulo) obj;
        return super.equals(r) && (this.perimeter() == r.perimeter() && this.getCor().equals(r.getCor()));
    }

    @Override
    public int compareTo(Object obj){
        if (this == obj) return 0;
        if (obj == null || getClass() != obj.getClass()) return -1;

        Retangulo r = (Retangulo) obj;
        if(this.area() < r.area() && !this.getCor().equals(r.getCor()))
            return -1;
        else if(this.area() > r.area())
            return 1;
        else 
            return 0; // Rectangles are equal
    }

    double area(){
        return length * height;
    }

    double perimeter(){
        return 4 * length * height;
    }
}

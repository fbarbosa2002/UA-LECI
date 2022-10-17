package aula05.ex_3;

public class Retangulo implements Comparable<Object> {
    private double length, height;

    public Retangulo(double length, double height){
        if(length > 0 && height > 0){
            this.length = length;
            this.height = height;
        }
    }

    public void set(double length, double height){
        if(length > 0 && height > 0){
            this.length = length;
            this.height = height;
        }
    }

    public double getLength(){ return length; }
    public double getHeight(){ return height; }

    @Override
    public String toString() {
        return "RETANGULO: Length: " + getLength() + "; Height: " + getHeight() + "\n     " + 
        "Area: " + String.format("%5.2f", area(this.getLength(), this.getHeight())) + "; Perimeter: " + String.format("%5.2f", perimeter(this.getLength(), this.getHeight())) + ";\n";
    }

    @Override
    public boolean equals(Object obj){
        if (this == obj) return true;
        if (obj == null | getClass() != obj.getClass()) return false;

        Retangulo r = (Retangulo) obj;
        
        return perimeter(this.getLength(), this.getHeight()) == perimeter(r.getLength(), r.getHeight());
    }

    @Override
    public int compareTo(Object obj){
        if (this == obj) return 0;
        if (obj == null || getClass() != obj.getClass()) return -1;

        Retangulo r = (Retangulo) obj;
        double a_r = area(this.getLength(), this.getHeight()), a_this = area(r.getLength(), r.getHeight());
        if(a_r < a_this)
            return -1;
        else if(a_r > a_this)
            return 1;
        else 
            return 0; // Rectangles are equal
    }

    public static double area(double l, double h){
        return l * h;
    }

    public static double perimeter(double l, double h){
        return 4*l*h;
    }
}

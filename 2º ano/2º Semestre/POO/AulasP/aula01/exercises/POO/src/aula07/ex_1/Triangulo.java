package aula07.ex_1;

import java.util.Arrays;

public class Triangulo extends Forma {
    private double[] sides;

    public Triangulo(double l1, double l2, double l3, String c){
        if(l1 > 0 && l2 > 0 && l3 > 0){
            this.sides = new double[3];
            sides[0] = l1;
            sides[1] = l2;
            sides[2] = l3;
            cor = c; // Use the abstract color attribute
        }
    }

    public void setTriangulo(double l1, double l2, double l3, String c){
        if(l1 > 0 && l2 > 0 && l3 > 0){
            this.sides = new double[3];
            sides[0] = l1;
            sides[1] = l2;
            sides[2] = l3;
            cor = c; // Use the abstract color attribute
        }
    }

    public double getS1(){ return (sides != null) ? sides[0] : null; }
    public double getS2(){ return (sides != null) ? sides[1] : null; }
    public double getS3(){ return (sides != null) ? sides[2] : null; }
    public double[] getSides(){ return (sides != null) ? sides : null; }
    String getCor(){return cor;}

    @Override
    public String toString() {
        if(sides != null)
            return "TRIANGULO: Side 1: " + getS1() + "; Side 2: " + getS2() + "; Side 3: " + getS3() + "\n     " + 
            "Area: " + String.format("%5.2f", this.area()) + "; Perimeter: " + String.format("%5.2f", this.perimeter()) + ";\n";
        return null;
    }

    @Override
    public boolean equals(Object obj){
        if(!(obj instanceof Triangulo) && getClass() != obj.getClass()) return false;

        Triangulo r = (Triangulo) obj;
        double[] original = this.getSides(); 
        Arrays.sort(original); // ordenar o array
        double[] aux = r.getSides(); 
        Arrays.sort(aux); // ordenar array
        boolean val = true;
        for(int i = 0; i < 3; i++){
            if(original[i] != aux[i]){
                val = false;
                break;
            }
        }
        return super.equals(r) && val;
    }

    @Override
    public int compareTo(Object obj){
        if (this == obj) return 0;
        if (obj == null || getClass() != obj.getClass()) return -1;

        Triangulo r = (Triangulo) obj;
        if(r.area() < this.area())
            return -1;
        else if(r.area() > this.area())
            return 1;
        else 
            return 0; // triangles are equal
    }

    double area(){
        double p = semiPerimeter();
        return Math.sqrt(p*(p-getS1())*(p-getS2())*(p-getS3())); // with heron formula
    }

    double semiPerimeter(){
        return perimeter()/2;
    }

    double perimeter(){
        return getS1() + getS2() + getS3();
    }
}

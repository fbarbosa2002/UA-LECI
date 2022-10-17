package aula05.ex_3;

import java.util.Arrays;

public class Triangulo implements Comparable<Object> {
    private double[] sides;

    public Triangulo(double l1, double l2, double l3){
        if(l1 > 0 && l2 > 0 && l3 > 0){
            this.sides = new double[3];
            sides[0] = l1;
            sides[1] = l2;
            sides[2] = l3;
        }
    }

    public void setTriangulo(double l1, double l2, double l3){
        if(l1 > 0 && l2 > 0 && l3 > 0){
            this.sides = new double[3];
            sides[0] = l1;
            sides[1] = l2;
            sides[2] = l3;
        }
    }

    public double getS1(){ return (sides != null) ? sides[0] : null; }
    public double getS2(){ return (sides != null) ? sides[1] : null; }
    public double getS3(){ return (sides != null) ? sides[2] : null; }
    public double[] getSides(){ return (sides != null) ? sides : null; }

    @Override
    public String toString() {
        if(sides != null)
            return "TRIANGULO: Side 1: " + getS1() + "; Side 2: " + getS2() + "; Side 3: " + getS3() + "\n     " + 
            "Area: " + String.format("%5.2f", area(this.getS1(), this.getS2(), this.getS3())) + "; Perimeter: " + String.format("%5.2f", perimeter(this.getS1(), this.getS2(), this.getS3())) + ";\n";
        return null;
    }

    @Override
    public boolean equals(Object obj){
        if (this == obj) return true;
        if (obj == null | getClass() != obj.getClass()) return false;

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
        return val;
    }

    @Override
    public int compareTo(Object obj){
        if (this == obj) return 0;
        if (obj == null || getClass() != obj.getClass()) return -1;

        Triangulo r = (Triangulo) obj;
        double a_r = area(r.getS1(), r.getS2(), r.getS3()), a_this = area(this.getS1(), this.getS2(), this.getS3());
        if(a_r < a_this)
            return -1;
        else if(a_r > a_this)
            return 1;
        else 
            return 0; // triangles are equal
    }

    public static double area(double s1, double s2, double s3){
        double p = semiPerimeter(s1, s2, s3);
        return Math.sqrt(p*(p-s1)*(p-s2)*(p-s3)); // with heron formula
    }

    public static double semiPerimeter(double s1, double s2, double s3){
        return perimeter(s1, s2, s3)/2;
    }

    public static double perimeter(double s1, double s2, double s3){
        return s1 + s2 + s3;
    }
}

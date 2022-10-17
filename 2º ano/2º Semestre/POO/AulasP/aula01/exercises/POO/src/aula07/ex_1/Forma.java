package aula07.ex_1;

// NOTE: cannot instance abstract classes
public abstract class Forma implements Comparable<Object> {
    protected String cor;

    abstract double area();
    abstract double perimeter();
    abstract String getCor();

    @Override
    public abstract int compareTo(Object obj);

    @Override
    public boolean equals(Object obj){
        if (this == obj) return true;
        if (obj == null) return false;
        return this.cor.equals(((Forma) obj).getCor());

    }

    @Override
    public abstract String toString();

}

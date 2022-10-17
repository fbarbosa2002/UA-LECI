package Treino_Teste.AULA06;

public class Conjunto {
    private int array[];
    private int counter;

    public Conjunto(){
        this.array= new int[10];
        this.counter=0;
    }

    public void set(int []array,int counter){
        this.array=array;
        this.counter=counter;
    }

    public void insert(int n){
        if(!contains(n)){
            array[counter++]=n;
        }
    }

    public boolean contains(int n){
        boolean test=false;
        for(int i=0;i<array.length;i++){
            if(array[i]==n){
                test=true;
            }
        }
        return test;
    }
    public void remove(int n){
        for(int i=0;i<array.length;i++){
            if(array[i]==n){
                array[i]=0;
                counter--;
            }
        }
    }

    public void empty(){
        for(int i=0;i<array.length;i++){
            array[i]=0;
        }
    }

    public int size(){
        return counter;
    }

    @Override public String toString(){
        String a="{ ";

        for(int i=0;i<counter;i++){
            if(array[i]!=0){
                a += array[i] + " ,  ";
            }
        }
        a+=" }";
        return a;
    }

    public Conjunto combine(Conjunto add){
        Conjunto a= new Conjunto();
        for(int i=0;i<add.size();i++){
            for(int j=0; j< array.length; j++){
                if(add.array[i] == this.array[j]){} else {
                    a.insert(array[i]);
                    a.insert(add.array[i]);
                }
            }
        }
        return a;
    }   

    public Conjunto subtract(Conjunto dif){
        Conjunto a= new Conjunto();

        for(int i=0;i<this.array.length;i++){
            if(!dif.contains(array[i])){
                a.insert(array[i]);
            }
        }
        return a;
    }

    public Conjunto intersect(Conjunto inter){
        Conjunto a= new Conjunto();

        for(int i=0;i<this.array.length;i++){
            if(inter.contains(array[i])){
                a.insert(array[i]);
            }
        }
        return a;
    }

}

package aula06;

public class Conjunto {
    int[] array;
    int count;

    public Conjunto(){
        this.array = new int[10];
        this.count = 0;
    }

    public Conjunto(int[] array, int count){
        if(count >= 0){
            this.array = array;
            this.count = count;
        }
    }

    public void insert(int n){
        if(!contains(n)){
            increaseSize();
            array[count++] = n;
        }
    }

    private void increaseSize(){
        if(array.length-1 == count){
            int[] aux = new int[array.length + 10];
            for(int i = 0; i < array.length; i++)
                aux[i] = array[i];
            array = aux;
        }
    }

    public boolean contains(int n){
        if(array == null || count == 0) return false;
        for(int i = 0; i < count; i++){
            if(array[i] == n) return true;
        }
        return false;
    }

    public void remove(int n){
        if(!contains(n)) return;
        int i;
        for(i = 0; i < count; i++){
            if(array[i] == n) break;
        }
        for(; i < count; i++){
            array[i] = array[i+1];
        }
        count--;
    }

    public void empty(){
        array = new int[array.length];
        count = 0;
    }

    @Override
    public String toString(){
        if(array == null) return "";
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < count; i++){
            sb.append(array[i] + " ");
        }
        
        return sb.toString();
    }

    public int size(){ return count;}
    public int[] getConjunto(){ return array; }

    public Conjunto combine(Conjunto add){
        if(add == null) return this;
        /*int[] result = new int[count + add.size()];
        System.arraycopy(array, 0, result, 0, count);
        System.arraycopy(add.getConjunto(), 0, result, count, add.size());

        Conjunto res = new Conjunto(result, count + add.size());
        for(int a1 = 0; a1 < res.size(); a1++){
            int matches = 0;
            for(int a2 = 0; a2 < res.size(); a2++){
                
            }
        }*/

        Conjunto result = new Conjunto(this.getConjunto(), this.size());
        int[] res = add.getConjunto();

        for(int i = 0; i < add.size(); i++){
            if(!result.contains(res[i]))
                result.insert(res[i]);
        }

        return result;
    }

    public Conjunto subtract(Conjunto diff){
        Conjunto result = new Conjunto();
        int[] res = this.getConjunto();
        for (int i = 0; i < size(); i++) {
            if (!diff.contains(res[i])) {
                result.insert(res[i]);
            }
        }
        return result;
    }

    public Conjunto intersect(Conjunto inter){
        Conjunto result = new Conjunto();
        int[] res = inter.getConjunto();

        for(int i = 0; i < inter.size(); i++){
            if(this.contains(res[i]))
                result.insert(res[i]);
        }

        return result;
    }


}

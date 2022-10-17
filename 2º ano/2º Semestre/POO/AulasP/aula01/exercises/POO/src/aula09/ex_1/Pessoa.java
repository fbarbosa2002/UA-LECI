package aula09.ex_1;

public class Pessoa implements Comparable<Pessoa> {
    private String nome;
    private int cc;
    private Date dataNasc;

    public Pessoa(String name, int cc, Date dataNasc){
        if(valid(name, cc, dataNasc)){
            this.nome = name;
            this.cc = cc;
            this.dataNasc = dataNasc;
        }
    }

    public void set(String name, int cc, Date dataNasc){
        if(valid(name, cc, dataNasc)){
            this.nome = name;
            this.cc = cc;
            this.dataNasc = dataNasc;
        }
    }

    public String getNome(){ return nome; }
    public int getCC(){ return cc;}
    public Date getDataNasc(){ return dataNasc;}

    private static boolean valid(String name, int cc, Date dataNasc){
        return name != null && cc >= 10e6 && dataNasc != null;

    }

    @Override public boolean equals(Object obj){
        if (this == obj) return true;
        if (obj == null) return false;
        if (!(this.getClass() == obj.getClass())) return false;
        Pessoa p = (Pessoa) obj;
        /** Compare attibutes */
        if (!(this.getNome().equals(p.getNome()))) return false;
        if (!(this.getCC() == p.getCC())) return false;
        if (!(this.getDataNasc().equals(p.getDataNasc()))) return false;
        return true;
    }

    @Override public int compareTo(Pessoa person){
        return this.getDataNasc().compareTo(person.getDataNasc());
    }

    @Override public int hashCode() {
        return getNome().hashCode() * ((Integer) cc).hashCode() * dataNasc.hashCode();
        /*final int prime = 31;
        int result = 1;
        result = prime * result + getCC();
        result = prime * result + ((getDataNasc() == null) ? 0 : getDataNasc().hashCode());
        result = prime * result + ((getNome() == null) ? 0 : getNome().hashCode());
        return result;*/
    }

    @Override
    public String toString(){
        return "Nome: " + getNome() + ", CC: " + getCC() + ", Data de Nascimento: " + getDataNasc();
    }
}

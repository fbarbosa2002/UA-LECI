package Treino_Teste.TREINO;

import java.util.HashSet;

public class AgenciaTuristica {
    private String nome,ender;
    private HashSet<Atividade> atividades;

    public AgenciaTuristica(String nome, String ender) {
        this.nome = nome;
        this.ender = ender;
        this.atividades= new HashSet<>();
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getEnder() {
        return ender;
    }
    public void setEnder(String ender) {
        this.ender = ender;
    }
    
    public void add(Atividade e){
        this.atividades.add(e);
    }
    public HashSet<Atividade> atividades(){
        return atividades;

    }
    public int totalItems(){
        int sum = 0;
        for(Atividade atividade : atividades) {
            sum += atividade.locais().size();
        }
        return sum;
    }    
    public String toString() {
        return String.format("Agencia Turistica %s\n\tAtividades: %s", this.nome, this.atividades.toString());
    }
}

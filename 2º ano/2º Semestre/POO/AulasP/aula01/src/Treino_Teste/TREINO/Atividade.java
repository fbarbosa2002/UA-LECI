package Treino_Teste.TREINO;

public abstract class Atividade implements PontosDeInteresse{
    private int ident;
    private String nome;

    public Atividade(int ident, String nome) {
        this.ident = ident;
        this.nome = nome;
    }
    public int getIdent() {
        return ident;
    }
    public void setIdent(int ident) {
        this.ident = ident;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    @Override
    public String toString() {
        return String.format("Atividade [num=%d, nome=%s]", this.ident, this.nome);
    }
}

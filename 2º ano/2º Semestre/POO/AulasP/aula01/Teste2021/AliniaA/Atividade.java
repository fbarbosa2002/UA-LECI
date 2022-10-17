public abstract class Atividade implements PontosdeInteresse {
    protected int numero;
    protected String nome;

    public Atividade(int numero, String nome) {
        this.numero = numero;
        this.nome = nome;
    }

    public int getNumero() { return this.numero; }
    public String getNome() { return this.nome; }

    @Override
    public String toString() {
        return String.format("Atividade [num=%d, nome=%s]", this.numero, this.nome);
    }
}

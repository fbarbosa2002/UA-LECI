public class Restaurante {
    private String nome;
    private TipoComida tipoComida;

    public Restaurante(String nome, TipoComida tipoComida) {
        this.nome = nome;
        this.tipoComida = tipoComida;
    }

    public String getNome() { return this.nome; }

    @Override
    public String toString() {
        return String.format("Restaurante [nome=%s, tipo=%s]", this.nome, this.tipoComida.toString());
    }
}

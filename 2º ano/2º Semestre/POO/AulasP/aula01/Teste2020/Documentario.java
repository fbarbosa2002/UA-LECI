package Teste2020;

public class Documentario extends Produto {
    private String titulo;
    private int ano;
    private int duracao;

    @Override
    public Double precoVendaAoPublico() {
        return super.getPrecoBase() * 1.23;
    }
}

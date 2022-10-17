package Teste2020;

import java.util.HashSet;

public class Telemovel extends Produto {
    private String marca;
    private String modelo;
    private HashSet<String> notas;

    public Telemovel(String marca, String modelo, Double preco) {
        super("T", preco);
        this.marca = marca;
        this.modelo = modelo;
        this.notas = new HashSet<>();
    }

    public void addNota(String nota) {
        notas.add(nota);
    }

    @Override
    public Double precoVendaAoPublico() {
        return super.getPrecoBase() * 1.23;
    }
}

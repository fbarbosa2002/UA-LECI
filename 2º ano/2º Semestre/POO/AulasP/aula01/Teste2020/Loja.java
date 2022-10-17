package Teste2020;

import java.util.TreeSet;

public class Loja {
    private String nome;
    private String endereco;
    private TreeSet<Produto> produtos;

    public Loja(String nome, String endereco) {
        this.nome = nome;
        this.endereco = endereco;
        produtos = new TreeSet<>();
    }

    public int totalItems() { return produtos.size(); }

    public void add(Produto produto) {
        produtos.add(produto);
    }
}

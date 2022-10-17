package Teste2020;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Livro extends Produto {
    private String titulo;
    private Set<Autor> autores;

    public Livro(String titulo, Double preco) {
        super("L",preco);
        this.titulo = titulo;
        autores = new HashSet<>();
    }
    public Livro(String titulo, Double preco, List<Autor> autores) {
        super("L",preco);
        this.titulo = titulo;
        for(Autor autor : autores) {
            this.autores.add(autor);
        }
    }

    public void add(Autor autor) {
        autores.add(autor);
    }

    public int numeroAutores() { return this.autores.size(); }
    public Set<Autor> autores() { return this.autores; }

    public String getTitulo() { return this.titulo; }
    public Set<Autor> getLista() { return this.autores; } // getAutores()



    @Override
    public Double precoVendaAoPublico() {
        return super.getPrecoBase() * 1.06;
    }
}

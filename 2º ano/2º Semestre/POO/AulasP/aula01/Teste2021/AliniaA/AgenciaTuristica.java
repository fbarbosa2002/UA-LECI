import java.util.HashSet;

public class AgenciaTuristica {
    private String nome;
    private String endereco;
    private HashSet<Atividade> atividades;

    public AgenciaTuristica(String nome, String endereco) {
        this.nome = nome;
        this.endereco = endereco;
        this.atividades = new HashSet<>();
	}

    public void add(Atividade exp) {
        atividades.add(exp);
    }

    public int totalItems() {
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

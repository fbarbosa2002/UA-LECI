import java.util.Collection;
import java.util.HashSet;
import java.util.TreeSet;

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

    public HashSet<Atividade> atividades() { return this.atividades; }

    public TreeSet<String> getAllItems() {
        TreeSet<String> returnSet = new TreeSet<>();
        for (Atividade atividade : atividades) {
            Collection<String> locais = atividade.locais();
            for (String local : locais) {
                returnSet.add(local);
            }
        }
        return returnSet;
    }

    @Override
    public String toString() {
        return String.format("Agencia Turistica %s\n\tAtividades: %s", this.nome, this.atividades.toString());
    }
}

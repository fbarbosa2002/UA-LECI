import java.util.ArrayList;
import java.util.List;

public class Gastronomia extends Atividade {
    private List<Restaurante> lista;
    
    public Gastronomia(int numero, String nome) {
        super(numero, nome);
        this.lista = new ArrayList<>();
    }
    public Gastronomia(int numero, String nome, List<Restaurante> lista) {
        super(numero, nome);
        this.lista = lista;
    }

    public void add(Restaurante restaurante) {
        lista.add(restaurante);
    }

    public int totalRestaurantes() {
        return this.lista.size();
    }

    public List<Restaurante> getLista() { return this.lista; }

    @Override
    public List<String> locais() {
        List<String> returnList = new ArrayList<>();
        for(Restaurante restaurante : this.lista) {
            returnList.add(restaurante.getNome());
        }
        return returnList;
    }
}

package Treino_Teste.TREINO;
import java.util.LinkedList;
import java.util.List;
import java.util.ArrayList;
public class Gastronomia extends Atividade{
    List<Restaurante> lista;

    public Gastronomia(int ident, String nome) {
        super(ident, nome);
        this.lista= new LinkedList<>();
    }
    public Gastronomia(int ident, String nome,List<Restaurante> lista) {
        super(ident, nome);
        this.lista= lista;
    }

    public List<Restaurante> getLista() {
        return lista;
    }

    public void setRestaurantes(List<Restaurante> restaurantes) {
        this.lista = restaurantes;
    }

    public void add(Restaurante e){
        this.lista.add(e);
    }
    public int totalRestaurantes(){
        return lista.size();
    }
    @Override
    public List<String> locais() {
        List<String> returnList = new ArrayList<>();
        for(Restaurante restaurante : this.lista) {
            returnList.add(restaurante.getNome());
        }
        return returnList;
    }
}

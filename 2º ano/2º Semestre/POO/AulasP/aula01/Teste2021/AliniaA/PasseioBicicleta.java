import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class PasseioBicicleta extends Atividade {
    private Set<String> locais;

    public PasseioBicicleta(int numero, String nome) {
        super(numero, nome);
        this.locais = new HashSet<>();
    }
    public PasseioBicicleta(int numero, String nome, String[] locais) {
        super(numero, nome);
        this.locais = new HashSet<>();
        for (String local : locais) {
            this.locais.add(local);
        }
    }

    public void addLocal(String local) {
        this.locais.add(local);
    }

    public List<String> locais() {
        List<String> returnList = new ArrayList<>();
        for (String local : locais) {
            returnList.add(local);
        }
        return returnList;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}

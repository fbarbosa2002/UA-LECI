package Treino_Teste.TREINO;
import java.util.List;
import java.util.ArrayList;

public class PasseioBicicleta extends Atividade{
    private String[] locais;

    public PasseioBicicleta(int ident, String nome, String[] locais) {
        super(ident, nome);
        this.locais=locais;
        
        for(int i=0;i<locais.length;i++){

        }
        
    }

    public PasseioBicicleta(int ident, String nome) {
        super(ident, nome);
        this.locais= new String[10];

    }
    public void addLocal(String local){
        for(int i=0;i<locais.length;i++){
            if(locais[i]==null){
                locais[i]=local;
            }
        }
    }
    @Override
    public List<String> locais() {
        List<String> returnList = new ArrayList<>();
        for(String local : locais) {
            if(returnList.contains(local)){}else{
            returnList.add(local);
            }
        }
        return returnList;
    }

}

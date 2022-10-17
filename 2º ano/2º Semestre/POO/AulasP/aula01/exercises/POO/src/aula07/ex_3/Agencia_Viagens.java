package aula07.ex_3;

public class Agencia_Viagens {
    private Alojamento[] alojamentos;
    private Carro[] viaturas;
    private int alojamentos_aux = 0, viaturas_aux = 0;
    private String nome, endereco;

    /** Default constructor */
    public Agencia_Viagens(String nome, String endereco){
        if(nome.isEmpty() || endereco.isEmpty()){
            System.out.println("A agencia precisa de um nome e endereço válidos");
            return;
        }
        this.endereco = endereco;
        this.nome = nome;
        eliminiar_alojamentos();
        eliminar_viaturas();
    }
    public int tamanho_alojamento(){ return alojamentos_aux; }
    public int tamanho_viaturas(){ return viaturas_aux; }

    public void eliminar_viaturas(){
        viaturas = new Carro[10];
        viaturas_aux = 0;
    }

    public void eliminiar_alojamentos(){
        alojamentos = new Alojamento[10];
        alojamentos_aux = 0;
    }

    public void aumentar_viaturas(){
        if(viaturas.length-1 == viaturas_aux){
            Carro[] aux = new Carro[viaturas.length + 10];
            for(int i = 0; i < viaturas.length; i++)
                aux[i] = viaturas[i];
            viaturas = aux;
        }
    }

    public void aumentar_alojamentos(){
        if(alojamentos.length-1 == alojamentos_aux){
            Alojamento[] aux = new Alojamento[alojamentos.length + 10];
            for(int i = 0; i < alojamentos.length; i++)
                aux[i] = alojamentos[i];
                alojamentos = aux;
        }
    }

    public boolean inserir_alojamento(Alojamento obj){
        if (obj == null) return false;
        aumentar_alojamentos();
        if(obj instanceof Apartamento){
            //alojamentos[alojamentos_aux] = new Apartamento();
            alojamentos[alojamentos_aux++] = (Apartamento) obj;
            return true;
        }else if(obj instanceof Quarto_Hotel){
            //alojamentos[alojamentos_aux] = new Quarto_Hotel();
            alojamentos[alojamentos_aux++] = (Quarto_Hotel) obj;
            return true;
        }
        return false;
    }

    public boolean inserir_viatura(Carro carro){
        if (carro == null) return false;
        aumentar_viaturas();
        //viaturas[viaturas_aux] = new Carro();
        viaturas[viaturas_aux++] = carro;
        return true;
    }

    public boolean encontrar_viatura(Carro n){
        if(viaturas == null || viaturas_aux == 0) return false;
        for(int i = 0; i < viaturas_aux; i++){
            if(viaturas[i] == n) return true;
        }
        return false;
    }

    public void remover_viatura(Carro n){
        if(!encontrar_viatura(n)) return;
        int i;
        for(i = 0; i < viaturas_aux; i++){
            if(viaturas[i] == n) break;
        }
        for(; i < viaturas_aux; i++){
            viaturas[i] = viaturas[i+1];
        }
        viaturas_aux--;
    }

    public boolean encontrar_alojamento (Alojamento n){
        if(alojamentos == null || alojamentos_aux == 0) return false;
        for(int i = 0; i < alojamentos_aux; i++){
            if((alojamentos[i] == n)) return true;
        }
        return false;
    }

    public void remover_alojamento (Alojamento n){
        if(!encontrar_alojamento(n)) return;
        int i;
        for(i = 0; i < alojamentos_aux; i++){
            if(alojamentos[i] == n) break;
        }
        for(; i < alojamentos_aux; i++){
            alojamentos[i] = alojamentos[i+1];
        }
        alojamentos_aux--;
    }

    @Override public String toString(){
        StringBuilder sb = new StringBuilder();

        sb.append("\nAlojamentos Registados");
        for(int i = 0; i < alojamentos_aux;i++){
            sb.append(i + "- " + alojamentos[i].toString());
        }
        sb.append("\nViaturas Registadas");
        for(int i = 0; i < viaturas_aux;i++){
            sb.append(i + "- " + viaturas[i].toString());
        }
        return sb.toString();
    }
}

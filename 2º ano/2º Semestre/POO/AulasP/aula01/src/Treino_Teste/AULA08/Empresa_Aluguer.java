package Treino_Teste.AULA08;

public class Empresa_Aluguer {
    private String nome,email,codpostal;
    private Viatura [] viaturas;
    private int nrviaturas;

    public Empresa_Aluguer(String nome,String codpostal,String email){
        this.nome=nome;
        this.codpostal=codpostal;
        this.email=email;

        this.viaturas= new Viatura[10];
    }

    public String getNome(){return nome;}
    public String getEmail(){return email;}
    public String getCodPostal(){return codpostal;}

    public void inserir_viaturas(Viatura viatura){
        redimensionar_viatura();
        viaturas[nrviaturas++]=viatura;
    }
    private void redimensionar_viatura(){
        if(viaturas.length >= nrviaturas) return;
        Viatura[] aux = new Viatura[viaturas.length + 10];
        for(int i = 0; i < viaturas.length; i++)
            aux[i] = viaturas[i];
        viaturas = aux;
    }

    public void eliminar_viatura(Viatura viatura){
        for(int i=0;i<nrviaturas;i++){
            if(viaturas[i]==viatura){
                viaturas[i]=null;
            }
        }
    }

}

package Treino_Teste.AULA08;

public class AutomovelLigeiroEletrico extends AutomovelLigeiro implements VeiculoEletrico  {
    private int cargaeletrica;

    public AutomovelLigeiroEletrico(String matricula, String marca, String modelo, int potencia,int bagageira,int cargaeletrica){
        super(matricula, marca, modelo, potencia, bagageira);
        this.cargaeletrica=cargaeletrica;
    }

    public int autonomia(){return cargaeletrica;}
    public void carregar(int percentagem){
        cargaeletrica+=percentagem;
    }

    
}

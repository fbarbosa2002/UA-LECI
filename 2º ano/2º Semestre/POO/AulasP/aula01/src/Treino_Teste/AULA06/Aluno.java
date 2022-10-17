package Treino_Teste.AULA06;



public class Aluno extends Pessoa {
    private static int nmec=99;
    private Date dataInsc;

    public Aluno(String nome, int cc, Date DataNasc, Date dataInsc){
        super(nome,cc,DataNasc);
        this.dataInsc=dataInsc;
        nmec++;
    }

    public Aluno(String nome, int cc, Date dataNasc){
        super(nome,cc,dataNasc);
        nmec++;
    }

    public int getNMec(){
        return nmec;
    }

    public Date getDataInsc(){
        return dataInsc;
    }


}

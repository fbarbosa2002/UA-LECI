package aula06;

// Aluno é herança de pessoa
public class Aluno extends Pessoa {
    int nmec = 100;
    Date dataInsc;

    public Aluno(String iNome, int iBI, Date iDataNasc, Date iDataInsc){
        super(iNome, iBI, iDataNasc);
        if(valid(iNome, iBI, iDataNasc, iDataInsc)){
            this.nmec = nmec++;
            this.dataInsc = iDataInsc;
        }
    }
    
    // nota: neste caso deve assumir a data atual
    public Aluno(String iNome, int iBI, Date iDataNasc){
        super(iNome, iBI, iDataNasc);
        if(valid(iNome, iBI, iDataNasc, new Date())){
            this.nmec = nmec++;
            this.dataInsc = new Date();
        }
    }
    

    public static boolean valid(String Nome, int BI, Date dataNasc, Date dataInsc){
        return Nome != "" && BI > 0 && dataNasc != null && dataInsc != null;
    }
    
    public int getNMec() { return nmec; } // retorna o número mecanográfico
    public Date getDataInsc(){ return dataInsc; }

    @Override
    public String toString(){
        return super.toString() + ", NMEC: " + getNMec() + ", Data de Inscrição: " + getDataInsc();
    }
}

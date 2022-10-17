public class Client {
    protected String nome,localidade;

    Client(String nome,String localidade)
    {
        this.nome = nome;
        this.localidade = localidade;
    }

    public String getNome()
    {
        return this.nome;
    }

    public String getLocalidade()
    {
        return this.localidade;
    }

    @Override
    public boolean equals(Object aux)
    {
        if(!(aux instanceof Client))
            return false;

        return (((Client)aux).getNome() == this.getNome() && ((Client)aux).getLocalidade() == this.getLocalidade()) ? true : false;
    }

    @Override
    public String toString()
    {
        return String.format("%s [%s]",this.nome,this.localidade);
    }
}

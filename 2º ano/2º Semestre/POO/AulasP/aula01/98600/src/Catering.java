public class Catering extends Activity{
    
    public static enum Option{
        LIGHT_BITES("Light bites"),
        DRINKS_AND_SNACKS("Drinks and Snacks"),
        FULL_MENU("Full Menu");

        private String desc;

        private Option(String s){ this.desc = s;};

        public String getDesc(){ return this.desc;};
    }

    protected Option opcao;

    Catering(Option tipo ,int participantes)
    {
        super(30,participantes);
        this.opcao = tipo;
    }

    public Option getOpcao()
    {
        return this.opcao;
    }

    @Override
    public String toString()
    {
        return String.format("Catering with '%s' option for %d participants.", this.opcao.getDesc(),super.participantes);
    }
}

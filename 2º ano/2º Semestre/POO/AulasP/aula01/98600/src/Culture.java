public class Culture extends Activity{

    public static enum Option{
        ARCHITECTURAL_TOUR("Architectural tour"),
        ART_MUSEUM("Art Museum"),
        RIVER_TOUR("River tour"),
        WINE_TASTING("Wine tasting");

        private String desc;

        private Option(String s){ this.desc = s;};

        public String getDesc(){ return this.desc;};
    }

    protected Option opcao;

    Culture(Option tipo,int participantes)
    {
        super(20,participantes);
        this.opcao = tipo;
    }

    public Option getOpcao()
    {
        return this.opcao;
    }


    @Override
    public String toString()
    {
        return String.format("%s with %d participants.", this.opcao.getDesc(),super.participantes);
    }
}

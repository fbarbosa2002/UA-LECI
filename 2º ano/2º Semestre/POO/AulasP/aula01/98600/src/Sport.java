



public class Sport extends Activity{
    
    public static enum Modality{
        KAYAK("Kayak"),
        HIKING("Hiking"),
        BOWLING("Bowling"),
        BIKE("Bike");

        private String desc;

        private Modality(String s){ this.desc = s;};

        public String getDesc(){ return this.desc;};
        
    }

    protected Modality modalidade;
    
    Sport(Modality modalidade ,int participantes)
    {
        super(25,participantes);
        this.modalidade = modalidade;
    }


    public Modality getModalidade()
    {
        return this.modalidade;
    }

    @Override
    public String toString()
    {
        return String.format("%s sporting activity with %d participants", this.modalidade.getDesc(),super.participantes);
    }
}

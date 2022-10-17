package Treino_Teste.Teste;

public class Sport extends Activity{
    public static enum Modality{
        HIKING("Hiking"),
        BIKE("Bike"), 
        BOWLING("Bowling"),
        KAYAK("Kayak");

        private String desc;

        private Modality(String s){this.desc=s;};

        public String getDesc(){return this.desc;};

    }

    protected Modality modalidades;

    public Sport(Modality modalidades,int part){
        super(part,25);
        this.modalidades=modalidades;
    }

    public Modality getModalidade()
    {
        return this.modalidades;
    }

    @Override
    public String toString()
    {
        return String.format("%s sporting activity with %d participants", this.modalidades.getDesc(),super.participants);
    }
}

package Treino_Teste.Teste;

public class Culture extends Activity {
   public static enum Option{
    ART_MUSEUM("Art Museum"),
    RIVER_TOUR("River Tour"),
    ARCHITECTURAL_TOUR("Architectural Tour"),
    WINE_TASTING("Wine Tasting");

    private String desc;

    private Option(String s){this.desc=s;};

    public String getDesc(){return this.desc;};

   }
   protected Option culture;

    public Culture(Option modalidades,int participants) {
        super(participants,20);
        this.culture=modalidades;
    }
    public Option getOpcao()
    {
        return this.culture;
    }


    @Override
    public String toString()
    {
        return String.format("%s with %d participants.", this.culture.getDesc(),super.participants);
    }
}

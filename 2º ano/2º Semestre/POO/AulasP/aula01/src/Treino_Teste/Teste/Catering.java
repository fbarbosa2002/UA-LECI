package Treino_Teste.Teste;


public class Catering extends Activity{
    public static enum Option{
        LIGHT_BITES("Light bites"),
        FULL_MENU("Full Menu"),
        DRINKS_AND_SNACKS("Drinks and snacks");

        private String desc;

        private Option(String opcao){this.desc=opcao;};

        public String getDesc(){
            return this.desc;
        };
    } 

    protected Option opcao;

    public Catering(Option option, int part) {
        super(part,30);
        this.opcao=option;
        
    }

    @Override
    public String toString()
    {
        return String.format("Catering with '%s' option for %d participants.", this.opcao.getDesc(),super.participants);
    }
   
}
    

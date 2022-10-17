
package Treino_Teste.Teste;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import Treino_Teste.TREINO.Atividade;
import Treino_Teste.Teste.Sport.Modality;

import java.time.LocalDate;

public class Event implements IEvent {
    protected LocalDate dataevento;
    protected List<Activity> lista= new LinkedList<>();

    
    public Event(LocalDate data) {
        this.dataevento=data;
    }

    public LocalDate getDate(){
        return this.dataevento;
    }
    public double totalCost(){
        return 0;
    }

    public Event addActivity(Activity activity){
        boolean condition=true;
        List<Sport.Modality> modalidade= new LinkedList<>();
        List<Culture.Option> option = new LinkedList<>();

        for(Activity at : lista){
            if(condition==true){
                lista.add(activity);
            }
        }
        return this;
    }

    @Override
    public String toString() {
        String str = String.format("*** Evento em %d-%02d-%02d,total=%.0f euros\n", 
        (int)this.getDate().getYear(), 
        (int)this.getDate().getMonthValue(), 
        (int)this.getDate().getDayOfMonth(),
        this.totalCost());
        
        for(Activity a : lista)
        {
            str += "\t" + a.toString() + "\n";
        }
        return str;
    }
    
}

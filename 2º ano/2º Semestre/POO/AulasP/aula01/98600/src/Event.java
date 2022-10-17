

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;



import java.time.LocalDate;

public class Event implements IEvent{
    
    List<Activity> atividadesEve = new ArrayList<>();
    protected LocalDate dataEvento;
    
    Event(LocalDate data)
    {
        this.dataEvento = data;
    }

    public Event addActivity(Activity atividade)
    {
        boolean canInsert = true;
        List<Sport.Modality> modsEx = new ArrayList<>();
        List<Culture.Option> optEx = new ArrayList<>();

        for(Activity at : atividadesEve)
        {
            if((at instanceof Catering )&& (atividade instanceof Catering)){
                canInsert = false;
                break;
            }

            if(at instanceof Sport)
            {
                modsEx.add(((Sport)at).getModalidade());
            }

            if(at instanceof Culture)
            {
                optEx.add(((Culture)at).getOpcao());
            }
        }

        if(atividade instanceof Sport)
        {
            if(modsEx.contains(((Sport)atividade).getModalidade()))
            {
                canInsert = false;
            };
        }

        if(atividade instanceof Culture)
        {
            if(optEx.contains(((Culture)atividade).getOpcao()))
            {
                canInsert = false;
            };
        }


        if(canInsert == true)
        {
            atividadesEve.add(atividade);
        }


        return this;

    }



    public LocalDate getDate()
    {
        return this.dataEvento;
    };

    public double totalCost()
    {
        double total = 0;
        for(Activity e : atividadesEve)
        {
            total += e.preco * e.participantes;
        }
        return total; //TODO
    };


    @Override
    public String toString()
    {
        String str = String.format("*** Evento em %d-%02d-%02d,total=%.0f euros\n", 
                                                (int)this.getDate().getYear(), 
                                                (int)this.getDate().getMonthValue(), 
                                                (int)this.getDate().getDayOfMonth(),
                                                this.totalCost());
        for(Activity a : atividadesEve)
        {
            str += "\t" + a.toString() + "\n";
        }
        return str;
    }
}

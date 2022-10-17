import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class EventManager {
    Set<Client> clientes;
    Map<Client,List<Event>> eventosCliente;
    String nome;

    EventManager(String nm)
    {
        clientes = new HashSet<>();
        eventosCliente = new HashMap<>();
        this.nome = nm;
    }


    public Client addClient(String nome,String localidade)
    {
        Client aux = new Client(nome, localidade);
        if(clientes.contains(aux))
            return null;
        
        clientes.add(aux);
        eventosCliente.put(aux, new ArrayList<>());
        return aux;
    }


    public Event addEvent(Client c, LocalDate dataEvento)
    {
        Event aux = new Event(dataEvento);
        List<Event> eventoC = eventosCliente.get(c);

        boolean canInsert = true;
        if(eventoC != null)
        {
            for(Event e : eventoC)
            {
                if(e.getDate().isEqual(dataEvento))
                    canInsert = false;
            }
        }

        if(canInsert)
            eventosCliente.get(c).add(aux);
    
        return aux;
    }


    public String listClients()
    {
        String str = "Clients: \n";
        for(Client c : clientes)
        {
            str += c.toString();
            str += '\n';
        }


        return str;
    }

    public String[] getClientsWithEvents()
    {
        String[] arr  = new String[clientes.size()];
        int i = 0;
        for (Client c : clientes)
        {
            if(eventosCliente.get(c).size() != 0)
            {
                arr[i] = c.toString();
                i++;
            }
        }
        return arr;
    }

    public String listEvents()
    {
        String str = "Events: \n";
        for(Client c : clientes)
        {
            str += c.toString();
            str += '\n';
            for(Event e : eventosCliente.get(c))
            {
                str += e.toString();
                str += "\n";
            }

        }


        return str;
  
    }


    public String[] getNextEventsByDate()
    {
        List<Event> aux = new LinkedList<>();

        for (Client c : clientes)
        {
            for(Event e : eventosCliente.get(c))
            {
                aux.add(e);
            }
        }

        String[] arr = new String[aux.size()];
        int i = 0;
        for(Event e: aux)
        {
            arr[i] = e.toString();
            i++;
        }

        return arr;
  
    }
    


    @Override
    public String toString()
    {
        return this.nome;
    }
}

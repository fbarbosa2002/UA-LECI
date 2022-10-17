package Treino_Teste.Teste;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

public class EventManager {
    private String nome;
    private Set<Client> clientes;
    private Map<Client,List<Event>> eventos;
    public EventManager(String nome) {
        this.nome = nome;
        this.clientes= new HashSet<>();
        eventos= new HashMap<>();
    }
    public Client addClient(String nome,String localidade)
    {
        Client aux = new Client(nome, localidade);
        if(clientes.contains(aux))
            return null;
        
        clientes.add(aux);
        eventos.put(aux, new ArrayList<>());
        return aux;
    }




    public Event addEvent(Client a, LocalDate c){
       Event evento=new Event(c);
       List<Event> listaeventos= eventos.get(a);

       boolean insert=true;

       if(listaeventos != null){

        for(Event eventos : listaeventos){

            if(eventos.getDate().isEqual(evento.getDate())){
                insert=false;
                break;
            }
        }
        if(insert){
            eventos.get(a).add(evento);
        }
        return evento;
       }
       
        return evento;
       
    }
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    public String listClients(){
        String string="";
        for(Client a: clientes){
            string+=a.toString();
        }
        return string;
    }

    public String[] getClientsWithEvents()
    {
        String[] arr  = new String[clientes.size()];
        int i = 0;
        for (Client c : clientes)
        {
            if(eventos.get(c).size() != 0)
            {
                arr[i] = c.toString();
                i++;
            }
        }
        return arr;
    }
    public String listEvents(){
        String string="Events: \n";
        
        for(Client a: clientes ){
            string += a.toString();
            string += '\n';

            for(Event e : eventos.get(a)){
                string += e.toString();
                string += '\n';
            }
        }
        return string;
    }

}

package small_evaluation;

import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Scanner;
import java.util.Set;

public class RandomTickets {
    private List<Ticket> ticketsList; // all of the loaded ticket
    private Map<Pessoa, Map<Ticket, Integer>> personTickets; // association between person, tickets an number of tickets
    
    public RandomTickets() {
        this.ticketsList = new LinkedList<>();
        personTickets = new LinkedHashMap<>();
        try (Scanner reader = new Scanner(new InputStreamReader(
            new FileInputStream("./src/small_evaluation/Lista_festivais.txt"),
            StandardCharsets.UTF_8))){
            reader.nextLine();  // Skip the header
            while(reader.hasNextLine()){
                String[] line = reader.nextLine().split("\t");
                ticketsList.add(new Ticket(
                    new Date(line[0]),
                    new Date(line[1]),
                    line[2],
                    line[3],
                    Integer.parseInt(line[4])
                ));
            }
            reader.close();
        } catch (Exception e) {
            System.err.println("Exception caught: " + e.getMessage());
            return;
        }
    }

    public RandomTickets(List<Ticket> ticketsList) {
        this.ticketsList = ticketsList;
        personTickets = new LinkedHashMap<>();
    }

    public List<Ticket> getTicketsList() {
        return this.ticketsList;
    }

    public void setTicketsList(List<Ticket> ticketsList) {
        this.ticketsList = ticketsList;
    }

    public RandomTickets ticketsList(List<Ticket> ticketsList) {
        setTicketsList(ticketsList);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof RandomTickets)) {
            return false;
        }
        RandomTickets randomTickets = (RandomTickets) o;
        return Objects.equals(ticketsList, randomTickets.ticketsList);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(ticketsList);
    }

    @Override
    public String toString() {
        return "{" +
            " ticketsList='" + getTicketsList() + "'" +
            "}";
    }

    public void getRandomTicket(Pessoa p){
        int ticketId = (int) (0 + (Math.random() * ticketsList.size()));  
        int numberTickets = (int) (1 + (Math.random() * 2));

        if(personTickets.containsKey(p)){ // check if the person has a ticket
            Map<Ticket, Integer> ticket_data = personTickets.get(p);
            if(ticket_data.containsKey(ticketsList.get(ticketId))){ // check if the person has this ticket
                if(ticket_data.get(ticketsList.get(ticketId)) <= 1){ // check if the person doesn't have more than one ticket
                    ticket_data.replace(ticketsList.get(ticketId), 2);
                    personTickets.replace(p, ticket_data);
                }else   // already has a ticket
                    return;
            }else{
                ticket_data.put(ticketsList.get(ticketId), numberTickets);
                personTickets.replace(p, ticket_data);
            }
        }else{ // the person doesn't have any ticket
            LinkedHashMap<Ticket, Integer> ticket_data = new LinkedHashMap<>();
            ticket_data.put(ticketsList.get(ticketId), numberTickets);
            personTickets.put(p, ticket_data);
        }
    }

    public void listPersons(){
        if (personTickets == null) return;

        //get all keys
        Set<Pessoa> keys = personTickets.keySet();

        System.out.println("Persons Listing");
        for(Pessoa key : keys){
            System.out.println("Person: " + key.getNome() + "; ");
            Map<Ticket, Integer> personKeys = personTickets.get(key);
            Set<Ticket> ticketsKeys = personKeys.keySet();

            for(Ticket t: ticketsKeys){
                System.out.println("    -> Festival Name: " + t.getName() + "; Number: " + personKeys.get(t));
            }
        }
        System.out.println(); // break-line
    }

    public void listAvailableTickets(){
        if (ticketsList == null) return;

        System.out.println("Available tickets listing");
        int tickets_found = 0;
        for(Ticket t:ticketsList){
            tickets_found = 0;
            Set<Pessoa> keys = personTickets.keySet();

            for(Pessoa key : keys){
                Map<Ticket, Integer> personKeys = personTickets.get(key);
                Set<Ticket> ticketsKeys = personKeys.keySet();
    
                for(Ticket tick: ticketsKeys){
                    if(t.equals(tick))
                        tickets_found += personKeys.get(t);
                }
            }
            System.out.println("Festival Name: " + t.getName() + "; Available tickets: " + (t.getNTickets() - tickets_found));
        }
        System.out.println();   // break-lines
    }
}

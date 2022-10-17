package small_evaluation;

import java.util.Objects;

public class Ticket {
    private Date startDate, endDate;
    private String name, place;
    private int nTickets;

    public Ticket() {
    }

    public Ticket(Date startDate, Date endDate, String name, String place, int nTickets) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.name = name;
        this.place = place;
        this.nTickets = nTickets;
    }

    public Date getStartDate() {
        return this.startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return this.endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPlace() {
        return this.place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public int getNTickets() {
        return this.nTickets;
    }

    public void setNTickets(int nTickets) {
        this.nTickets = nTickets;
    }

    public Ticket startDate(Date startDate) {
        setStartDate(startDate);
        return this;
    }

    public Ticket endDate(Date endDate) {
        setEndDate(endDate);
        return this;
    }

    public Ticket name(String name) {
        setName(name);
        return this;
    }

    public Ticket place(String place) {
        setPlace(place);
        return this;
    }

    public Ticket nTickets(int nTickets) {
        setNTickets(nTickets);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Ticket)) {
            return false;
        }
        Ticket randomTickets = (Ticket) o;
        return Objects.equals(startDate, randomTickets.startDate) && Objects.equals(endDate, randomTickets.endDate) && Objects.equals(name, randomTickets.name) && Objects.equals(place, randomTickets.place) && nTickets == randomTickets.nTickets;
    }

    @Override
    public int hashCode() {
        return Objects.hash(startDate, endDate, name, place, nTickets);
    }

    @Override
    public String toString() {
        return "{" +
            " startDate='" + getStartDate() + "'" +
            ", endDate='" + getEndDate() + "'" +
            ", name='" + getName() + "'" +
            ", place='" + getPlace() + "'" +
            ", nTickets='" + getNTickets() + "'" +
            "}";
    }


}

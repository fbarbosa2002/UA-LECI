package aula11.ex_2;

import java.util.Objects;

public class Voo implements Comparable<Voo> {
    private Time time, delays;
    private String name, agency, origin, observations;

    public Voo(Time time, Time delays, String name, String agency, String origin) {
        this.time = time;
        this.delays = delays;
        this.name = name;
        this.agency = agency;
        this.origin = origin;
        this.observations = !delays.equals(new Time(0, 0)) ? "Previsto: " + (time.add(delays)) : "";
    }

    public Time getTime() {
        return this.time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public Time getDelays() {
        return this.delays;
    }

    public void setDelays(Time delays) {
        this.delays = delays;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAgency() {
        return this.agency;
    }

    public void setAgency(String agency) {
        this.agency = agency;
    }

    public String getOrigin() {
        return this.origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getObservation() {
        return this.observations;
    }

    public void setObservations(String obs) {
        this.observations = obs;
    }

    public Voo time(Time time) {
        setTime(time);
        return this;
    }

    public Voo delays(Time delays) {
        setDelays(delays);
        return this;
    }

    public Voo name(String name) {
        setName(name);
        return this;
    }

    public Voo agency(String agency) {
        setAgency(agency);
        return this;
    }

    public Voo origin(String origin) {
        setOrigin(origin);
        return this;
    }

    public Voo observation(String obs) {
        setObservations(obs);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Voo)) {
            return false;
        }
        Voo voo = (Voo) o;
        return Objects.equals(time, voo.time) && 
            Objects.equals(delays, voo.delays) && 
            Objects.equals(name, voo.name) && 
            Objects.equals(agency, voo.agency) && 
            Objects.equals(origin, voo.origin);
    }

    @Override
    public int compareTo(Voo flight){
        return getTime().compareTo(flight.getTime()); 
    }

    @Override
    public String toString() {
        return "{" +
            " time='" + getTime() + "'" +
            ", name='" + getName() + "'" +
            ", agency='" + getAgency() + "'" +
            ", origin='" + getOrigin() + "'" +
            ", delay='" + getDelays() + "'" +
            ", obs='" + getObservation() + "'" +
            "}";
    }
    
}

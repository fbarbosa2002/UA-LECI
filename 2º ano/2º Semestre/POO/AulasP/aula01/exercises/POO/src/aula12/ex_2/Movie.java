package aula12.ex_2;

import java.util.Objects;

public class Movie implements Comparable<Movie>{
    private String name, genre, rating;
    private double score;
    private int time;

    public Movie() {
    }

    public Movie(String name, double score, String rating, String genre, int time) {
        this.name = name;
        this.genre = genre;
        this.rating = rating;
        this.score = score;
        this.time = time;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGenre() {
        return this.genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getRating() {
        return this.rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public double getScore() {
        return this.score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public int getTime() {
        return this.time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public Movie name(String name) {
        setName(name);
        return this;
    }

    public Movie genre(String genre) {
        setGenre(genre);
        return this;
    }

    public Movie rating(String rating) {
        setRating(rating);
        return this;
    }

    public Movie score(double score) {
        setScore(score);
        return this;
    }

    public Movie time(int time) {
        setTime(time);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Movie)) {
            return false;
        }
        Movie movie = (Movie) o;
        return Objects.equals(name, movie.name) && Objects.equals(genre, movie.genre) && Objects.equals(rating, movie.rating) && score == movie.score && time == movie.time;
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, genre, rating, score, time);
    }

    @Override
    public int compareTo(Movie movie){
        if (movie == this)
            return 0;
        return this.name.compareTo(movie.name);
    }

    @Override
    public String toString() {
        return "->" +
            " name='" + getName() + "'" +
            ", genre='" + getGenre() + "'" +
            ", rating='" + getRating() + "'" +
            ", score='" + getScore() + "'" +
            ", time='" + getTime() + "'" +
            "";
    }
    
}

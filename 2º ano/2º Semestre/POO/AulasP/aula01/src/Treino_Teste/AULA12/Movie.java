package Treino_Teste.AULA12;

public class Movie {
    private String name,genre,rating;
    private int running_time;
    private double score;
    public Movie(String name,double score, String rating,  String genre,int running_time) {
        this.name = name;
        this.genre = genre;
        this.rating = rating;
        this.running_time = running_time;
        this.score = score;
    }
    public String getName() {
        return name;
    }
    public String getGenre() {
        return genre;
    }
    public String getRating() {
        return rating;
    }
    public int getRunning_time() {
        return running_time;
    }
    public double getScore() {
        return score;
    }
    @Override public String toString(){
        return name + "\t" + score + "\t" + rating + "\t" + genre + "\t" + running_time + "\n";
    }
}

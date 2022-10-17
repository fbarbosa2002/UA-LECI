package Teste2020;

public class Electrodomestico extends Produto {
    private String tipo;
    private String marca;
    private String modelo;
    private ClasseEnergetica classe;
    private Double potencia;

    public Electrodomestico(String tipo, String marca, String modelo, Double potencia, Double preco) {
        super("E", preco);
        this.tipo = tipo;
        this.marca = marca;
        this.modelo = modelo;
        this.potencia = potencia;
    }
    public Electrodomestico(String tipo, String marca, String modelo, int potencia, int preco) {
        super("E", Double.valueOf(preco) );
        this.tipo = tipo;
        this.marca = marca;
        this.modelo = modelo;
        this.potencia = Double.valueOf(potencia);
    }
    public Electrodomestico(String tipo, String marca, String modelo, Double preco) {
        super("E", preco);
        this.tipo = tipo;
        this.marca = marca;
        this.modelo = modelo;
    }
    public Electrodomestico(String tipo, String marca, String modelo, int preco) {
        super("E", Double.valueOf(preco) );
        this.tipo = tipo;
        this.marca = marca;
        this.modelo = modelo;
    }


    public void setClasse(ClasseEnergetica classe) {
        this.classe = classe;
    }

    public String getDescricao() { return String.format("%s:%s/%s", tipo, marca, modelo); }

    @Override
    public Double precoVendaAoPublico() {
        return super.getPrecoBase() * 1.23;
    }
}

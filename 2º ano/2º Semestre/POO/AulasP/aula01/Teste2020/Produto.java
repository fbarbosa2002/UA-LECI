package Teste2020;

public abstract class Produto implements PVP {
    static private int proxCodigo;
    private String codigo;
    private int quantidade;
    private Double precoBase;

    public Produto(String produtoCode, Double precoBase) {
        this.codigo = String.format("%s%d", produtoCode, proxCodigo++);
        this.precoBase = precoBase;
    }

    public void setStock(int stock) {
        this.quantidade = stock;
    }

    public void addStock(int stock) {
        this.quantidade += stock;
    }

    public boolean vender(int stock) {
        if( this.quantidade-stock < 0 ) return false;
        this.quantidade -= stock;
        return true;
    }

    public Double getPrecoBase() { return this.precoBase; }
}

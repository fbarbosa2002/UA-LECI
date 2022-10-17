package aula08.ex_1;

public interface VeiculoEletrico {
    //int autonomia = 0;    // representa autonomia com carga completa
    
    void carregar(int percentagem); // simula um carregamento até ‘percentagem’
    int autonomia();    // devolve autonomia restante    
}

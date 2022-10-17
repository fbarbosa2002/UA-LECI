package aula08.ex_1;

import java.util.Scanner;
import java.util.InputMismatchException;

public class main_1a {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Empresa_Aluguer emp = null;
        loadingScreen();
        String nome = readStringValue("Insira o nome da empresa: ", sc);
        String email = readStringValue("Insira o email da empresa: ", sc);
        String codigo_postal = readStringValue("Insira o código-postal da empresa: ", sc);
        String matricula, marca, modelo , numero_quadro;
        int cilindrada, bagageira, licenca, peso, carga_maxima, max_passageiros, opt;
        emp = new Empresa_Aluguer(nome, codigo_postal, email);
        boolean run = true;
        while(run){
            menuScreen();
            int choice = readIntValue("Escolha: ", sc, 0, 5);
            System.out.println();
            switch(choice){
                case 5:
                    System.out.println(emp.toString());
                    break;
                case 4:
                    if(emp.getViaturasSize() > 0){
                        System.out.println(emp.listar_viaturas());
                        opt = readIntValue("Escolha o ID da viatura para adicionar o trajeto: ", sc, 0, emp.getViaturasSize()-1);
                        Viatura veiculo = emp.encontrar_viatura_Index(opt);
                        veiculo.trajeto(readIntValue("Quantos quilómetros foi o trajeto? ", sc, 0, Integer.MAX_VALUE));
                    } else
                        System.out.println("Não existem viaturas");
                    break;                
                case 3:
                    System.out.print(emp.maior_distancia());
                    System.out.println("Com " + emp.maior_distancia().distanciaTotal() + " Quilómetros");
                    break;
                case 2:
                    if(emp.getViaturasSize() > 0){
                        System.out.println(emp.listar_viaturas());
                        opt = readIntValue("Escolha o ID da viatura para remover: ", sc, 0, emp.getViaturasSize()-1);
                        Viatura veiculo = emp.encontrar_viatura_Index(opt);
                        emp.remover_viatura(veiculo);
                    } else
                        System.out.println("Não existem viaturas");
                    break;
                case 1:
                    Boolean run2 = true;
                    while(run2){
                        viaturaTypeMessage();
                        opt = readIntValue("Opção? ", sc, 1, 5);
                        switch(opt){
                            case 5:
                                matricula = readStringValue("Matricula do Pesado de Passageiros: ", sc);
                                marca = readStringValue("Marca do Pesado de Passageiros: ", sc);
                                modelo = readStringValue("Modelo do Pesado de Passageiros: ", sc);
                                cilindrada = readIntValue("Cilindrada do Pesado de Passageiros: ", sc, 0, Integer.MAX_VALUE);
                                numero_quadro = readStringValue("Número de Quadro do Pesado de Passageiros: ", sc);
                                max_passageiros = readIntValue("Máximo de Passageiros do Pesado de Passageiros: ", sc, 0, Integer.MAX_VALUE);
                                peso = readIntValue("Peso do Pesado de Passageiros: ", sc, 0, Integer.MAX_VALUE);                               
                                Viatura passageiros = new Pesado_Passageiros(matricula, marca, modelo, numero_quadro, cilindrada, peso, max_passageiros);
                                emp.inserir_viatura(passageiros);
                                run2 = false;
                                break;
                            case 4:
                                matricula = readStringValue("Matricula do Pesado de Mercadorias: ", sc);
                                marca = readStringValue("Marca do Pesado de Mercadorias: ", sc);
                                modelo = readStringValue("Modelo do Pesado de Mercadorias: ", sc);
                                cilindrada = readIntValue("Cilindrada do Pesado de Mercadorias: ", sc, 0, Integer.MAX_VALUE);
                                numero_quadro = readStringValue("Número de Quadro do Pesado de Mercadorias: ", sc);
                                carga_maxima = readIntValue("Carga máxima do Pesado de Mercadorias: ", sc, 0, Integer.MAX_VALUE);
                                peso = readIntValue("Peso do Pesado de Mercadorias: ", sc, 0, Integer.MAX_VALUE);                               
                                Viatura mercadorias = new Pesado_Mercadorias(matricula, marca, modelo, numero_quadro, cilindrada, peso, carga_maxima);
                                emp.inserir_viatura(mercadorias);
                                run2 = false;
                                break;
                            case 3:
                                matricula = readStringValue("Matricula do Taxi: ", sc);
                                marca = readStringValue("Marca do Taxi: ", sc);
                                modelo = readStringValue("Modelo do Taxi: ", sc);
                                cilindrada = readIntValue("Cilindrada do Taxi: ", sc, 0, Integer.MAX_VALUE);
                                numero_quadro = readStringValue("Número de Quadro do Taxi: ", sc);
                                bagageira = readIntValue("Capacidade de Bagageira do Taxi: ", sc, 0, Integer.MAX_VALUE);
                                licenca = readIntValue("Licença do Taxi: ", sc, 0, Integer.MAX_VALUE);                               
                                Viatura taxi = new Taxi(matricula, marca, modelo, numero_quadro, cilindrada, bagageira, licenca);
                                emp.inserir_viatura(taxi);
                                run2 = false;
                                break;
                            case 2:
                                matricula = readStringValue("Matricula do Automóvel Ligeiro: ", sc);
                                marca = readStringValue("Marca do Automóvel Ligeiro: ", sc);
                                modelo = readStringValue("Modelo do Automóvel Ligeiro: ", sc);
                                cilindrada = readIntValue("Cilindrada do Automóvel Ligeiro: ", sc, 0, Integer.MAX_VALUE);
                                numero_quadro = readStringValue("Número de Quadro do Automóvel Ligeiro: ", sc);
                                bagageira = readIntValue("Capacidade de Bagageira do Automóvel Ligeiro: ", sc, 0, Integer.MAX_VALUE);
                                Viatura auto = new Automovel_Ligeiro(matricula, marca, modelo, numero_quadro, cilindrada, bagageira);
                                emp.inserir_viatura(auto);
                                run2 = false;
                                break;
                            case 1:
                                matricula = readStringValue("Matricula do Motociclo: ", sc);
                                marca = readStringValue("Marca do Motociclo: ", sc);
                                modelo = readStringValue("Modelo do Motociclo: ", sc);
                                cilindrada = readIntValue("Cilindrada do Motociclo: ", sc, 0, Integer.MAX_VALUE);
                                String tipo;
                                do{
                                    tipo = readStringValue("Tipo do Motociclo: ", sc);
                                } while(!(tipo.toLowerCase().equals("estrada") || tipo.toLowerCase().equals("desportivo")));
                                Viatura moto = new Motociclo(matricula, marca, modelo, cilindrada, tipo);
                                emp.inserir_viatura(moto);
                                run2 = false;
                                break;
                            default:
                                break;
                        }
                    }
                    break;
                case 0:
                    run = false;
                    break;
                default: 
                    System.out.println("Opção errada");
                    break;
            }
        }
    
    }

    public static String readStringValue(String message, Scanner sc){
        String value;
        while (true){
            try {
                System.out.print(message);
                value = sc.next();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        return value;
    }

    public static int readIntValue(String message, Scanner sc, int min, int max) {
        int value;
        while (true){
            try {
                System.out.print(message);
                value = sc.nextInt();
                if(value < min || value > max)
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Looks like you shouldn't be introducing that !!!");
                sc.nextLine(); // Flush the bad input
            }
        }
        return value;
    }

    public static void loadingScreen(){
        System.out.println("\n########################################");
        System.out.println("##   Bem-vindo ao software de Gestão  ##");
        System.out.println("##      de uma empresa de aluger      ##");
        System.out.println("########################################\n");
    }

    public static void menuScreen(){
        System.out.println("\n########################################");
        System.out.println("##    Que operação deseja realizar?   ##");
        System.out.println("##        1 - Adicinar Viatura        ##");
        System.out.println("##        2 - Remover Viatura         ##");
        System.out.println("##        3 - Maior Distância         ##");
        System.out.println("##        4 - Adicinar Trajeto        ##");
        System.out.println("##        5 - Ver dados da empresa    ##");
        System.out.println("##        0 - Sair                    ##");
        System.out.println("########################################\n");
    }

    public static void viaturaTypeMessage(){
        System.out.println("\n########################################");
        System.out.println("##       Selecione o Veículo:         ##");
        System.out.println("##        1 - Motociclo               ##");
        System.out.println("##        2 - Automóvel Ligeiro       ##");
        System.out.println("##        3 - Táxi                    ##");
        System.out.println("##        4 - Pesado Mercadorias      ##");
        System.out.println("##        5 - Pesado Passageiros      ##");
        System.out.println("########################################\n");
    }
}

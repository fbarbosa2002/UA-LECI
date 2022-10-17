package aula09.ex_1;

import java.util.ArrayList;
import java.util.List;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

import java.util.Collections;

public class ALDemo_b {
    public static void main(String[] args) {
        System.out.println("## Always enable assertions before running ##");
        ArrayList<Integer> c1 = new ArrayList<>();
        for (int i = 10; i <= 100; i+=10)
            c1.add(i);
        assert c1.size() == 10;

        System.out.println("Size: " + c1.size());

        for (int i = 0; i < c1.size(); i++)
            System.out.println("Elemento: " + c1.get(i));

        ArrayList<String> c2 = new ArrayList<>();
        c2.add("Vento");
        c2.add("Calor");
        c2.add("Frio");
        c2.add("Chuva");
        assert c2.size() == 4;
        assert c2.contains("Vento");
        assert c2.indexOf("Frio") == 2;

        System.out.println(c2);
        Collections.sort(c2);
        System.out.println(c2);
        c2.remove("Frio");
        c2.remove(0);
        
        assert c2.size() == 2;
        assert !c2.contains("Frio");
        assert c2.indexOf("Vento") == c2.size()-1;
        System.out.println(c2);

        c2.add(1, "Mar");
        c2.add("Mar");
        assert c2.lastIndexOf("Mar") == c2.size()-1;
        System.out.println(c2);

        assert c2.get(0).equals("Chuva");
        c2.set(0, "Calor");
        assert c2.get(0).equals("Calor");
        System.out.println(c2);

        List<String> c2_2 = c2.subList(1, 3);
        assert c2_2.size() == 2;
        System.out.println(c2_2);

        /****************** Pessoa *****************/
        Set<Pessoa> c3 = new HashSet<>();
        c3.add(new Pessoa("António Alfredo", 30256714, new Date(10,4,1990)));
        c3.add(new Pessoa("Silvia Francisca", 15682099, new Date(1,1,2000)));
        c3.add(new Pessoa("João Santos", 28103475, new Date(20,2,2008)));
        c3.add(new Pessoa("Quim Barreiros", 13478650, new Date(15,10,1995)));
        c3.add(new Pessoa("Maria Joaquina", 30164578, new Date(25,5,1970)));
        assert c3.size() == 5;
        System.out.println(c3);

        Iterator<Pessoa> itr = c3.iterator();
        while(itr.hasNext()){  
            System.out.println(itr.next());  
        }  
        c3.add(new Pessoa("Maria Joaquina", 30164578, new Date(25,5,1970)));
        System.out.println(c3.size());
        // NEED HASHFUNCTION
        assert c3.size() == 5; // No equal elements in Set
        
        /****************** TreeSet *****************/
        Set<Date> c4 = new TreeSet<>();
        c4.add(new Date(12,12,2012));
        c4.add(new Date(1,2,2000));
        c4.add(new Date(30,9,1990));
        c4.add(new Date(8,3,1970));
        c4.add(new Date(20,1,1801));
        assert c4.size() == 5;
        
        Iterator<Date> itrTree = c4.iterator();
        while(itrTree.hasNext()){  
            System.out.println(itrTree.next());  
        }  

        c4.add(new Date(20,1,1801)); // shouldn't add
        assert c4.size() == 5;
        assert c4.contains(new Date(20,1,1801));
        
    }
}
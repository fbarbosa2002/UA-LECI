package aula09.ex_1;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

public class ALDemo {
    public static void main(String[] args) {
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

    }
}

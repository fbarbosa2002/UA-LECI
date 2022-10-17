package aula09.ex_2;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.TreeSet;

public class CollectionTester {
    public static void main(String[] args) {
        final int[] DIM = {1000, 5000, 10000, 20000, 40000, 100000};
        double[][] measures = new double[9][DIM.length]; // 9 rows, 6 cols
        Collection<Integer> coll;
        for(int d = 0; d < 3; d++){
            if(d == 0)
                coll = new ArrayList<>();
            else if(d == 1)
                coll = new LinkedList<>();
            else
                coll = new TreeSet<>();

            for(int l = 0; l < DIM.length; l++){
                double[] result = checkPerformance(coll, DIM[l]);
                measures[0][l] = result[0];
                measures[1][l] = result[1];
                measures[2][l] = result[2];
            }
        }

        showMeasure(measures, DIM);
    }

    private static double[] checkPerformance(Collection<Integer> col, int DIM) {
        int aux = 0;
        double[] times = new double[3];
        double start, stop, delta;
        // Add
        start = System.nanoTime(); // clock snapshot before
        for(int i=0; i<DIM; i++ )
            col.add( i );
        stop = System.nanoTime(); // clock snapshot after
        times[aux++] = delta = (stop-start)/1e6; // convert to milliseconds
        
        // Search
        start = System.nanoTime(); // clock snapshot before
        for(int i=0; i<DIM; i++ ) {
            int n = (int) (Math.random()*DIM);
            if (!col.contains(n))
                System.out.println("Not found???"+n);
        }
        stop = System.nanoTime(); // clock snapshot after
        times[aux++] = delta = (stop-start)/1e6; // convert nanoseconds to milliseconds

        // Remove
        start = System.nanoTime(); // clock snapshot before
        Iterator<Integer> iterator = col.iterator();
        while (iterator.hasNext()) {
            iterator.next();
            iterator.remove();
        }
        stop = System.nanoTime(); // clock snapshot after
        times[aux++] = delta = (stop-start)/1e6; // convert nanoseconds to milliseconds

        return times;
    }

    private static void showMeasure(double[][] measures, final int[] DIM){
        System.out.printf("Collection%12s%9s%9s%9s%9s%9s\n", DIM[0], DIM[1], DIM[2], DIM[3], DIM[4], DIM[5]);
        String[] names = {"ArrayList", "LinkedList", "TreeSet"};
        for(int lc = 0; lc < 3; lc++){
            System.out.println(names[lc]);
            for(int r = 0; r < 3; r++){
                if(r == 0) System.out.print("add");
                else if(r == 1) System.out.print("search");
                else System.out.print("remove");
                System.out.printf("%19.1f", measures[r][0]);
                for(int c = 1; c < 6; c++){
                    System.out.printf("%9.1f", measures[r][c]);
                }
                System.out.println();
            }
        }
    }
}
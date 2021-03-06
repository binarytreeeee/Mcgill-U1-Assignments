import java.lang.*;

public class SelectionSort {

    public static void sort(Comparable[] a) {
        SelectionSort(a);
    }

    // create you selectionSort method here 
    // use the MergeSort class for inspiration
    public static void SelectionSort(Comparable[] a) {
        int i = a.length - 1;

        while (i > 0) {
            int indmax = FindMaxIndex(a, i);
            Swap(a,indmax,i);
            i = i-1;
        }
    }

    public static void Swap(Comparable[] a, int i, int j) {
        Comparable tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }

    public static int FindMaxIndex(Comparable[] a, int z) {
        //finds the index of max up to z
        Comparable max = a[0];
        int indmax = 0;
        for(int i = 1; i <= z; i++) {
            if(a[i].compareTo(max) > 0) {
                max = a[i];
                indmax = i;
            }
        }
        return indmax;
    }
}

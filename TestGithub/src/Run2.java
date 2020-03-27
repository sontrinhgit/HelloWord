import java.util.ArrayList;
import java.util.Iterator;

public class Run2 {
	public static void main(String[] args) {
		ArrayList<String> ar = new ArrayList<String>();
		ar.add("Java");
		ar.add("PHP");
		ar.add("C#");
		ar.add("JS");

		Iterator<String> it = ar.iterator();

		while (it.hasNext()) {
			System.out.print(it.next() + " ");
		}
		System.out.println();

		
	}
}

package test;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str = "qwertyQ1!";
		
		if(str.matches("^(?=.*[A-Z].)(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,}$")) {
			System.out.println("matches");
		}
		else {
			System.out.println("no match");
		}
	}

}

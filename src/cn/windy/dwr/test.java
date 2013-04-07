package cn.windy.dwr;

public class test {
	public static void main(String[] args) {
		String[][] ar = new String[3][3];
		for(int i=0 ; i<3 ; i++){
			for(int j=0;j<3;j++){
				ar[i][j] = i+"" + j;  
			}
		}
		for(int i=0 ; i<3 ; i++){
			for(int j=0;j<3;j++){
				System.out.print(ar[i][j] + "  ");
			}
			System.out.println();
		}
	}
}

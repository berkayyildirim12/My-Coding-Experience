/**
 * Author: Berkay Yildirim s5101002        
 * Date: 08/12/2018
 * Week 20 Higher or Lower Upload 4 Task 3
 * This is a program that adds up numbers in a file and ignores everything that isn't an int
 * if it hits incorrect data then it will it carries on adding up the valid data.
 */
import java.io.*;  
import java.util.*;

public class addingNumbers {

	public void Adding() throws IOException {

		int number = 0;
		int total = 0;


		File outFile = new File("Invalid.txt");
		FileOutputStream fileOut = new FileOutputStream(outFile);
		BufferedWriter buffWritR = new BufferedWriter(new OutputStreamWriter(fileOut));
		File inFile = new File("Numbers.txt"); 
		Scanner fileScanner = null;

		try {
			fileScanner = new Scanner(inFile);
			while (fileScanner.hasNextLine())
			{				
				if(fileScanner.hasNextInt()) {
					number=fileScanner.nextInt();
					System.out.println(number);
					total = total + number;				
				}else {
					String prov = fileScanner.nextLine();
					buffWritR.write(prov);
					buffWritR.newLine();
				}
			}
		}
		catch(FileNotFoundException ex) {
			System.out.println("File doesn't exist");
		}
		finally {
			fileScanner.close();
			buffWritR.close();
		}
		System.out.println("The total is:"+ total);
	}
	public static void main(String[]args) throws Exception {
		addingNumbers aW = new addingNumbers();
		aW.Adding();
	}
}


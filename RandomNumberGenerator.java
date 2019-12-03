/**
 * Author: Berkay Yildirim s5101002        
 * Date: 07/12/2018
 * Week 19 Random Number Generator Upload 4 Task 1
 * This program contains multiple methods to generate and return numbers within a certain range.
 * In one method, it returns a number between 1 and hundred. the second method takes a parameter 
 * specifying the top number and returning a number within that range.
 * The third one has two values passed to it both bottom and top of the range and returns a number within that range.
 * The final one is an array that returns 10 random numbers within a range and no numbers are duplicated.
 */
import java.util.Arrays; 
import java.util.Random;
public class RandomNumberGenerator {

	public static void main(String[] args) {

		int firstRandom=oneToHundred();
		System.out.println("Random number is: "+ firstRandom);
		int secondRandom=parameterMax(50);
		System.out.println("Random number is: "+ secondRandom);
		int thirdRandom = parameterMaxMin(20,10);
		System.out.println("Random number is: "+ thirdRandom);
		int[] fourthRandom = randomArray();
		System.out.println( Arrays.toString(fourthRandom));

	}

	static int oneToHundred() 
	{
		Random numberGenerator = new Random();
		int OneToHun= numberGenerator.nextInt(100)+1;
		return OneToHun;
	}

	static int parameterMax(int numberOne) 
	{
		Random numberGenerator = new Random();
		int paraMax = numberGenerator.nextInt(numberOne)+1;
		return paraMax;
	}

	static int parameterMaxMin(int number1, int number2)

	{
		Random numberGenerator = new Random();
		int paraMaxMin = numberGenerator.nextInt(number1-number2) + number2;
		return paraMaxMin;
	}

	static int[] randomArray() 
	{
		Random numberGenerator = new Random();
		{
			boolean duplicateDetect;
			int numbers;
			int numArray[] = new int[10];
			for (int i=0; i<numArray.length; i++) 
			{
				do {
					duplicateDetect= false;
					numbers = numberGenerator.nextInt(10)+1;
					for( int j = 0 ; j<numArray.length; j++){
						if (numbers== numArray[j])
						{
							duplicateDetect = true;
						}
					}
				}while(duplicateDetect);
				numArray[i] = numbers;
			}
			return numArray;
		}

	}
}

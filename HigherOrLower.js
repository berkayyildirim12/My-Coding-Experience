/**
* Author: Berkay Yildirim s5101002      
* Date: 13/10/2018
* Week 16 Higher or Lower Upload 3 Task 2
* This is a program that simulates the game Higher or Lower guessing card game. The program will generate a random number and ask the user to guess higher or lower, 
* if they guess correctly then another number is generated and the user goes again. If the guess is incorrect then the user loses and will be asked to play again.
*/

var userInput;
var nextCard;

var currentCard = Math.floor(Math.random() *13)+1;
console.log("Card is "+ currentCard);
userInput=prompt("(H)igher or (L)ower:");
nextCard = Math.floor(Math.random() *13)+1;

while (userInput.toUpperCase()!="N") 
{
	if	(userInput.toUpperCase()=="H" && nextCard<currentCard) 
{
	console.log("Card is "+ nextCard);
	userInput=prompt("Card is lower you lose - Play again? Y/N:").toUpperCase();
	nextCard = Math.floor(Math.random() *13)+1;
}

	else if(userInput.toUpperCase()=="L" && nextCard>currentCard) 
{
	console.log("Card is "+ nextCard);
	userInput=prompt("Card is Higher you lose - Play again? Y/N:").toUpperCase();
	nextCard = Math.floor(Math.random() *13)+1;
}
	else 
{
	if ((userInput.toUpperCase()=="H") || (userInput.toUpperCase()=="L") || (userInput.toUpperCase()=="Y")) 
{		
	currentCard = nextCard;
	console.log("Card is "+ nextCard);
}

	userInput=prompt("(H)igher or (L)ower:").toUpperCase();
	nextCard = Math.floor(Math.random() *13)+1;
}

}

console.log("Thank you for playing.");
/**
* Author: Berkay Yildirim s5101002 
* Date: 10/10/2018
* Week 16 Leisure Centre Upload 3 Task 1
* This is a program that calculates how much discount a customer gets at a leisure by taking their age and membership as input and working out the discount they receive by putting them in a certain category
*/

var memberShip=prompt("Enter Bronze,Silver or Gold Membership:");
var age=prompt("Enter age:")

if(memberShip=="bronze" && age<16 || memberShip=="bronze" && age>60) 
	{
		console.log("You get 20% discount");
	}
else if(memberShip=="bronze") 
	{
		console.log("You get 10% discount");
	}

else if(memberShip=="silver" && age<16 || memberShip=="silver" && age>60) 
	{
		console.log("You get 25% discount");
	}
else if(memberShip=="silver") 
	{
		console.log("You get 15% discount");
	}

else if(memberShip=="gold" && age<16 || memberShip=="gold" && age>60) 
	{
		console.log("You get 35% discount");
	}
else if(memberShip=="gold") 
	{
		console.log("You get 25% discount");
	}
else 
	{
		console.log("Invalid Entry")
	}

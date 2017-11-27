#!/bin/bash
echo "This is a Script designed to perform simple mathematical calculations"
echo "Enter the first number"
read num1
echo "Enter the second number"
read num2
echo "Select an operator"
echo "1 = Addition"
echo "2 = Subtration"
echo "3 = Division"
read operator
if [ $operator -eq 1 ] 
then 
	echo "The addition answer is" $(($num1 + $num2))
	else
		if [ $operator -eq 2 ] 
		then 
			echo "The subtraction answer is" $(($num1 - num2))
		
		else
			if [ $operator -eq 3 ]
			then 
				echo "The division answer is" $(($num1 / $num2))
			
			else
				echo "Invalid Input"
		fi
	fi
fi 

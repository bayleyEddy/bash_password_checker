#!/bin/bash


# CS 362: Systems Admin. Final

#Objective: Read the password as an argument and display its strength: weak, medium, or strong

# This is a variable to hold the first argument
password="$1"


# Check to see if only one argument has been entered
if [ $# -eq 1 ]; then
	echo "confirming password..."
	echo "For the most accurate answers, please only use special characters from the following list: @ % _ - + "  
	

# Len < 6: Check to see if the argument is less than 6 characters
	if [ ${#password} -lt 6 ]; then
# This one'll be more general since all of the cases require at LEAST 6 characters
		echo "Weak: Your password needs to be greater or equal to a MINIMUM of 6 characters"
		
		
		
# 6 <= Len <= 8: Checks to see if the password is greater/equal to 6 while less/equal to 8
	elif [ ${#password} -ge 6 ] && [ ${#password} -le 8 ]; then
		echo "still confirming..."
	
# Checks for alphanumeric + special characters (only @%_+-) 
		if [[ $password =~ [a-z] ]] && [[ $password =~ [A-Z] ]] && [[ $password =~ [0-9] ]] && [[ $password =~ [@%_\+\-] ]]; then
			echo "Medium: Needs to be more than 12 characters to be strong"
		else 
# Prints out the remaining cases, since the remaining are all "Weak":
			echo "Weak: Try adding more letters, numbers, and special characters"
		fi




# 9 <= Len <= 12: Checks to see if the argument is greater/equal to 9 and less/equal to 12
	elif [ ${#password} -ge 9 ] && [ ${#password} -le 12 ]; then
		echo "...even more confirming..."
# Tests for only letters
		if [[ $password =~ ^[a-zA-Z]+$ ]]; then
			echo "Weak: Use more than just letters, you need to add some numbers and special characters"
# Test for only numbers
		elif [[ $password =~ ^[0-9]+$ ]]; then
			echo "Weak: Use more than just numbers, you need to add some letters and special characters"
# Test for only numbers and special characters
		elif [[ $password =~ ^[0-9@%_\+\-]+$ ]]; then
			echo "Weak: Remember to include letters and not just numbers and special characters"
		else
# This is for the cases with "Medium" strengths
			echo "Medium: Almost there, remember to add a few more letters, numbers, and special characters and you'll be there"
		fi
		
# Len > 12: Checks to see if the argument is more than 12 characters long
	elif [ ${#password} -gt 12 ]; then
		echo "...processing..."
# Checks for alphanumeric + special characters (only @%_+-) 
		if [[ $password =~ [a-z] ]] && [[ $password =~ [A-Z] ]] && [[ $password =~ [0-9] ]] && [[ $password =~ [@%_\+\-] ]]; then
			echo "Strong: Congrats you made a strong password, requirements met successfully"
# Test for only letters (alphabetical)
		elif [[ $password =~ ^[a-zA-Z]+$ ]]; then
			echo "Weak: You need to add more numbers and special characters"
# Test for only numbers (numerical)
		elif [[ $password =~ ^[0-9]+$ ]]; then
			echo "Weak: You need to add more letters and special characters"
		else
# This is for the "Medium" strengths
			echo "Medium: You need to include more letters, numbers, and special characters"
		fi
	else 
		echo "There seems to be an error with the amount of characters added"
		echo "If this is reached then you may have entered a faulty special character"
		echo "Try limiting your special character use to: @ % _ - +"
		
	fi		
	
else 
	echo "Your password should NOT include any spaces"
	echo "If that is not the issue, then it may be your special characters, please only use the following:"
	echo "@ % _ - +"
fi

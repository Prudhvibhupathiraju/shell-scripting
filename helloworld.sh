#!/bin/bash
echo "Hello, Welcome to shell scripting"
person1=Prudhvi
person2=Babitha
person3=Ayaansh
echo "$person1, $person2 and $person3 are one family"
Person1=$1
Person2=$2
echo "$Person1 and $Person2 are best friends"
echo "What is your age $Person1"
read age
echo "Hey, you are $age $Person1 !"
echo "What is the age of $Person2 ?"
read age2
gap=$(($age-$age2))
echo "Age gap between $Person1 and $Person2 is $gap"
echo "total arguments passed :: $#"
echo "All the arguments passed :: $@"
echo "script-name :: $0"
user=$(whoami)
echo "User logged in is $user"
friuts=("Apple" "Kiwi" "Mango")
echo "Fruit 1 is ${friuts[0]}"
echo "Fruit 2 is ${friuts[1]}"
echo "Fruit 3 is ${friuts[2]}"
if [ $age2 -ge 2]
then
echo "$Person2 ate ${fruits[0]}"
else
echo "$Person2 ate ${fruits[1]}"
fi
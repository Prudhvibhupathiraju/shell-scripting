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
gap=($age - $age2)
echo "Age gap between $Person1 and $Person2 is $gap"
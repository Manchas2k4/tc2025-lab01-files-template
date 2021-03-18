#!/bin/bash

rm app temp.txt

sed -i 's/\r//g' $1
sed -i 's/\r//g' output.txt

cal=0

echo "Compiling..."
gcc $1 -o app
if [[ $? -ne 0 ]] ; then
	echo "grade: $cal"
	exit 1
fi
echo " done"
cal=$((cal+10))

echo "Checking parameters..."
./app > /dev/null 2>&1
if [[ $? -ne 255 ]] ; then
	echo "grade: $cal"
	rm app
	exit 1
fi
cal=$((cal+15))
echo " done"

echo "Verifying that the input file exists..."
./app dont_exist output.txt > /dev/null 2>&1
if [[ $? -ne 254 ]] ; then
	echo "grade: $cal"
	rm app
	exit 1
fi
cal=$((cal+15))
echo " done"

echo "Verifying the operation of the program..."
./app input.txt temp.txt > /dev/null 2>&1
sed -i 's/\r//g' temp.txt
diff temp.txt output.txt > /dev/null 2>&1
if [[ $? -ne 0 ]] ; then
	echo "grade: $cal"
	rm app temp.txt
	exit 1
fi
echo " done"

cal=$((cal+60))
echo "=>grade: $cal"

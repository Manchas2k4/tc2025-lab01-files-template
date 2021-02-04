#!/bin/bash
# If the test runs successfully, that's 15 additional points.

gcc $1 -o app
./app dont_exist output.txt
if [[ $? -ne 254 ]] ; then 
	exit 1
fi
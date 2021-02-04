#!/bin/bash
# If the test runs successfully, that's 15 additional points.

gcc $1 -o app
./app
if [[ $? -ne 255 ]] ; then 
	exit 1
fi
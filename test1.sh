#!/bin/bash
# If the test runs successfully, that's 10 additional points.

gcc $1
if [[ $? -ne 0 ]] ; then 
	exit 1
fi
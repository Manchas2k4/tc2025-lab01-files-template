#!/bin/bash
# If the test runs successfully, that's 60 additional points.

gcc $1 -o app
./app input.txt temp.txt
diff temp.txt output.txt
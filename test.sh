#!/bin/bash
read filename
echo "This is a line count of file with file name" $filename
wc -l < $filename
echo "All done with" $0

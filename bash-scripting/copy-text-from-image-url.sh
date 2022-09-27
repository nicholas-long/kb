#!/bin/bash
# copy and read text from PNG image URL arg print with tesseract OCR

tf=$(mktemp -d)
cd $tf
wget $1
filename=$(ls)
tesseract "$filename" output
ls
cat output.txt
cd - >/dev/null
rm -rf $tf

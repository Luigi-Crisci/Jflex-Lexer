#!/bin/bash
usage(){
	echo "usage: bash start.sh FILENAME"
	exit 0
}

if [ $# -ne 1 ]
then 
	usage
fi

echo "Processing file $1"
mvn compile
java -cp target/classes/ Lexer $1

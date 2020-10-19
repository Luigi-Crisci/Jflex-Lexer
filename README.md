# Automated Lexer

A simple lexer made with Jflex

## Requirements

- Java 8 (or higher)
- Maven

## Build

To build source files, type

> mvn generate-sources

To compile, type

> mvn compile

This project is provived with a simple *bash* script to compile and test it. To use the script type

> bash start.sh TESTFILE_PATH

The script will parse the testfile at *TESTFILE_PATH*, printing each token it recognize to standard output.

## Structure

This Lexer is written in `flex` and is compiled with `Jflex`, an open source tool for generating Lexer in Java.  

It is composed of a single `Lexer.flex` source file contaning all the logic to generate a Lexer.  

### Lexemes

This Lexer implementation recognizes the following Tokens:  
- *Delimiters*
- *Keywords*
- *Identifiers*
- *Literals*
- *Separators (like brackets, colon etc.)*
- *Operators* 

</br> 
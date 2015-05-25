# Rfunctions

## Description
             
Here are some functions I've made for the R language. If you find one useful,
feel free to clone it and enjoy!


## tab2latex

Function to convert an R dataframe into a latex dataframe's body to easily 
include it in a document

### Arguments

X : dataframe to convert

fileName : String to name the output file ["tablatex"]

showColumns : Boolean. Show column names ? [TRUE]

showRows : Boolean. Show row names ? [FALSE]

naString : String to insert instead of NA's ["NA"]

align : Character. Tabular's algnment ([c], r, l)

caption : String. Caption for the table

label : String. Label for the table

float : Boolean. Make a table environment ? [FALSE]

round : Vector. Round the content of the specified column(s)
        The first number is the column and the second is the number of digits
        It can be repeated

## tabInput

Function to make interactive inputs of R dataframes.
You can enter numeric values, character values, repeated sequences of numbers or
characters or make operations on two or more columns and input the names of
columns. Blank in numeric input will result in NA.

### Arguments

nrows : number of rows

ncols : number of columns

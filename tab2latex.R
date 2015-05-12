#################################################
#           tab2latex function
# A little function to convert R dataframes
# into latex dataframes' body
#################################################


tab2latex <- function(
    X,                          #dataframe to convert
    fileName = "tablatex.tex",  #String: file name
    showColumns = TRUE,         #Bool: show column names ?
    showRows = FALSE,           #Bool: show row names ?
    naString = "NA",            #String to insert instead of NA's
    ...                         #Take X if 'X=' is missing
    )
{
    if (missing(X))
        X = ...
    
    write.table(
        x = X,
        file = fileName,
        na = naString,
        col.names = showColumns,
        row.names = showRows,
        sep = " & ",
        quote = FALSE,
        eol = " \\\\\n"
    )
}
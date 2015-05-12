tab2latex <- function(
    X,                      #dataframe to convert
    fileName = "tablatex",  #String: file name
    showColumns = TRUE,     #Bool: show column names ?
    showRows = FALSE,       #Bool: show row names ?
    naString = "NA"         #String to insert instead of NA's
    )
{
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
#################################################
#           tab2lateX function
# A little function to convert R dataframes
# into lateX dataframes' body
#################################################


tab2lateX <- function(
    X,                          #dataframe to convert
    fileName = "tablateX.teX",  #String: file name
    showColumns = TRUE,         #Bool: show column names ?
    showRows = FALSE,           #Bool: show row names ?
    naString = "NA",            #String to insert instead of NA's
    align = "c",                #Alignement: "c", "r", "l" [c]
    caption = "",               #Caption. None if not defined
    label = "",                 #Label. None if not defined
    float = FALSE,              #Bool: make a table environment ?
    round = c(0),               #Vector: round the content of the column
                                #   The first number is the column
                                #   The second is the number of digits
                                #It can be repeated
    ...                         #Take X if 'X=' is missing
    )
{
    #if (missing(X))
    #    X = ...
        
    if (showRows == TRUE)
        nColumns = length(X)+1
    else
        nColumns = length(X)

    if (round[1] != 0)
    {
        i <- 1
        while (i <= length(round))
        {
            X[round[i]] <- round(X[round[i]], digits = round[i+1])
            i = i+2
        }
    }
    
    con <- file(description = fileName, open = "w")

    if (float == TRUE)
        cat("\\begin{table}\n", file = con)
    if (caption != "")
        cat("\\caption{", caption, "}\n", sep = "", file = con)
    if (label != "")
        cat("\\label{", label, "}\n", sep = "", file = con)

    cat("\\begin{tabular}{", rep(X = align, nColumns), "}\n", sep = "", file = con)

    if (showRows == TRUE & showColumns == TRUE)
    {
        cat(" ", colnames(X), sep = " & ", file = con)
        cat(" \\\\ \n", file = con)
    }
    else if (showColumns == TRUE)
    {
        cat(colnames(X), sep = " & ", file = con)
        cat(" \\\\ \n", file = con)
    }

    write.table(
        x = X,
    #    file = fileName,
        file = con,
        na = naString,
        col.names = FALSE,
        row.names = showRows,
        sep = " & ",
        quote = FALSE,
        eol = " \\\\\n"
    )
    cat("\\end{tabular}\n", file = con)
    if (float == TRUE)
        cat("\\end{table}\n", file = con)

    close(con)
}

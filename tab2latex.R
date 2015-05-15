#################################################
#           tab2latex function
# A little function to convert R dataframes
# into latex dataframes' body
#################################################


tab2latex <- function(
    x,                          #dataframe to convert
    fileName = "tablatex.tex",  #String: file name
    showColumns = TRUE,         #Bool: show column names ?
    showRows = FALSE,           #Bool: show row names ?
    naString = "NA",            #String to insert instead of NA's
    align = "c",                #Alignement: "c", "r", "l" [c]
    caption = "",               #Caption. None if not defined
    label = "",                 #Label. None if not defined
    float = FALSE,              #Bool: make a table environment ?
    round = c(-1),               #Vector: round the content of the column
                                #   The first number is the column
                                #   The second is the number of digits
                                #It can be repeated
                                #If just one number, all the columns are rounded 
                                # to that umber
    ...                         #Unused
    )
{
    if (showRows == TRUE)
        nColumns = length(x)+1
    else
        nColumns = length(x)

    if (round[1] != -1)
    {
        if (length(round) == 1)
        {
            i <- 1
            while (i <= length(x))
            {
                x[i] <- round(x[i], digits = round[1])
                i = i+1
            }
        }
        else
        {
            while (i <= length(round))
            {
                x[round[i]] <- round(x[round[i]], digits = round[i+1])
                i = i+2
            }
        }
    }
    
    con <- file(description = fileName, open = "w")

    if (float == TRUE)
        cat("\\begin{table}\n", file = con)
    if (caption != "")
        cat("\\caption{", caption, "}\n", sep = "", file = con)
    if (label != "")
        cat("\\label{", label, "}\n", sep = "", file = con)

    cat("\\begin{tabular}{", rep(x = align, nColumns), "}\n", sep = "", file = con)

    if (showRows == TRUE & showColumns == TRUE)
    {
        cat(" ", colnames(x), sep = " & ", file = con)
        cat(" \\\\ \n", file = con)
    }
    else if (showColumns == TRUE)
    {
        cat(colnames(x), sep = " & ", file = con)
        cat(" \\\\ \n", file = con)
    }

    write.table(
        x = x,
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

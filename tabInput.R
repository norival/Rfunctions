tabInput  <- function(
            nrows,
            ncols
            )

{
  print("Nom des colonnes ?")
    colNames <- scan(what = 'character', nmax = ncols, quiet = TRUE)
  
  tabTmp <- matrix(nrow = nrows, ncol = nColumns)

  i <- 1
  while (i <= ncols)
  {
    print(paste(colNames[i], "?"))
    a <- scan(nmax = nrows, quiet = TRUE, what = c('character', 'numeric'))
    tabTmp[, i] <- a
    i = i+1
  }
  b <- as.data.frame(tabTmp)
  colnames(b) <- colNames

  return(b)
}

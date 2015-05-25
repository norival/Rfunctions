tabInput  <- function(
            nrows,
            ncols
            )

{
  print("Nom des colonnes ?")
    colNames <- scan(what = 'character', nmax = ncols, quiet = TRUE)
  
  tabTmp <- data.frame(c(rep('A', nrows)))

  i <- 1
  while (i <= ncols)
  {
    print(paste(colNames[i], "?"))
    print("Numeric or charcater ?(n/c)")
    rep <- scan(n = 1, what = 'character')
    if (rep == 'c')
    {
      a <- scan(nmax = nrows, quiet = TRUE, what = 'character')
      tabTmp <- cbind.data.frame(tabTmp, a)
    }
    else
    {
      a <- scan(n = nrows, quiet = TRUE, blank.lines.skip = TRUE)
      tabTmp <- cbind.data.frame(tabTmp, as.numeric(a))
    }
    i = i+1
  }
  
b <- tabTmp[, 2:length(tabTmp)]
colnames(b) <- colNames

return(b)
}

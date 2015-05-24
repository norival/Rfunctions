tabInput  <- function(
  
)

{
  print("Nombre de colonnes ?")
    nColumns <- scan(nmax = 1)
  print("Nombre de lignes ?")
    nRows <- scan(nmax = 1)
  print("Nom des colonnes ?")
    colNames <- scan(what = 'character', nmax = nColumns)
  
  tabTmp <- matrix(nrow = nRows, ncol = nColumns)

  i <- 1
  while (i <= nColumns)
  {
    print(paste(colNames[i], "?"))
    j <- 1
    while (j <= nRows)
    {
      print(paste("ligne", j))
      tabTmp[j, i] <- scan(nmax = 1, quiet = TRUE)
      j = j+1
    }

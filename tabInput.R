tabInput  <- function(
            nrows,
            ncols
            )

{
  print("Columns' names?")
  colNames <- scan(what = 'character', nmax = ncols, quiet = TRUE)
  
  tabTmp <- data.frame(c(rep('A', nrows)))

  i <- 1
  while (i <= ncols)
  {
    print(paste(colNames[i], "?"))
    print("Numeric, charcater, repeated num or repeated char?(n/c/rn/rc)")
    rep <- scan(n = 1, what = 'character', quiet = TRUE)

    if (rep == 'c')
    {
      print("Values?")
      a <- scan(n = nrows, quiet = TRUE, what = 'character', blank.lines.skip = FALSE)
      tabTmp <- cbind.data.frame(tabTmp, a)
    }

    else if (rep == 'rc')
    {
      j <- 0
      a <- vector()
      while (j < nrows)
      {
        print("Element?")
        element <- scan(n = 1, quiet = TRUE, what = 'char')
        times <- nrows + 1
        while (j + times > nrows)
        {
          print(paste("How many times ? (1-", nrows-j, ")", sep =""))
          times <- scan(n = 1, quiet = TRUE)
        }
        a <- c(a, rep(element, times))
        j = j + times
      }
      tabTmp <- cbind.data.frame(tabTmp, a)
    }

    else if (rep == 'rn')
    {
      j <- 0
      a <- vector()
      while (j < nrows)
      {
        print("Element?")
        element <- scan(n = 1, quiet = TRUE)
        times <- nrows + 1
        while (j + times > nrows)
        {
          print(paste("How many times ? (1-", nrows-j, ")", sep =""))
          times <- scan(n = 1, quiet = TRUE)
        }
        a <- c(a, rep(element, times))
        j = j + times
      }
      tabTmp <- cbind.data.frame(tabTmp, as.numeric(a))
    }

    else if (rep == 'op')
    {      
      print("Which columns?")
      columns <- scan(quiet = TRUE) 
      print("Operation?")
      operator <- scan(quiet = TRUE, what = 'char', n = 1)
      i <- 1
      if (operator == '+')
      {
        a <- rep(0, nrows)
        while (i <= length(columns))
        {
          a <- a + tabTmp[columns[i]]
          i = i+1
        }
      }
      if (operator == '*')
      {
        a <- rep(0, nrows)
        while (i <= length(columns))
        {
          a <- a * tabTmp[columns[i]]
          i = i+1
        }
      }
      if (operator == '-')
      {
        a <- tabTmp[columns[i]]
        i <- 2
        while (i <= length(columns))
        {
          a <- a - tabTmp[columns[i]]
          i = i+1
        }
      }
      if (operator == '/')
      {
        a <- tabTmp[columns[i]]
        i <- 2
        while (i <= length(columns))
        {
          a <- a / tabTmp[columns[i]]
          i = i+1
        }
      }
      tabTmp <- cbind.data.frame(tabTmp, as.numeric(a))
    }

    else
    {
      print("Values?")
      a <- scan(n = nrows, quiet = TRUE, blank.lines.skip = FALSE)
      tabTmp <- cbind.data.frame(tabTmp, as.numeric(a))
    }
    i = i+1
  }
  
b <- tabTmp[, 2:length(tabTmp)]
colnames(b) <- colNames

return(b)
}

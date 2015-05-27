###############################################################################
#                                tabInput
# Author: Xavier Laviron
# Goal:   Interactive input of dataframes
# Infos:  https://github.com/Norival/Rfunctions
#
# Released under the terms of the GNU GPL v3, see file 'LICENSE' for more
# informations
#
##############################################################################

tabInput  <- function(
                      nrows,
                      ncols
                      )         PROUT

{
  print("Columns' names?")
  colNames <- scan(what = 'character', n = ncols, blank.lines.skip = FALSE, quiet = TRUE)

  tabTmp <- data.frame(c(rep('A', nrows)))

  i <- 1
  while (i <= ncols)
  {
    print(paste(colNames[i], "?"))
    print(paste("Numeric, charcater, repeated num, repeated char, sequence",
                " or operation?(n/c/rn/rc/seq/op)", sep = ""))
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
      columns <- scan(quiet = TRUE, nmax = ncols-1) 
      print("Operation?")
      operator <- scan(quiet = TRUE, what = 'char', n = 1)
      j <- 1
      if (operator == '+')
      {
        a <- tabTmp[columns[j]+1]
        j <- 2
        while (j <= length(columns))
        {
          a <- a + tabTmp[columns[j]+1]
          j = j+1
        }
      }
      if (operator == '*')
      {
        a <- tabTmp[columns[j]+1]
        j <- 2
        while (j <= length(columns))
        {
          a <- a * tabTmp[columns[j]+1]
          j = j+1
        }
      }
      if (operator == '-')
      {
        a <- tabTmp[columns[j]+1]
        j <- 2
        while (j <= length(columns))
        {
          a <- a - tabTmp[columns[j]+1]
          j = j+1
        }
      }
      if (operator == '/')
      {
        a <- tabTmp[columns[j]+1]
        j <- 2
        while (j <= length(columns))
        {
          a <- a / tabTmp[columns[j]+1]
          j = j+1
        }
      }
      tabTmp <- cbind.data.frame(tabTmp, a)
    }

    else if (rep == 'seq')
    {
      j <- 0
      a <- vector()
      while (j < nrows)
      {
        to <- nrows
        from <- 0
        while (abs(to-from)+1 > nrows-j)
        {
          print(paste("From? (", j+1, "/", nrows, ", ", nrows-j, " left)", sep = ""))
          from <- scan(n = 1, quiet = TRUE)
          print("To?")
          to <- scan(n = 1, quiet = TRUE)
        }
        a <- c(a, from:to)
        j <- j + abs(to-from)+1
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

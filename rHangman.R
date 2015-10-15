# rHangman : r implementation of the famous Hangman's game!
# Author: Xavier Laviron
# It's to be used when statistics' class bore you...
#
# Just call the function rHangman with the path of the dictionnary you want to
# use,
# given as a string
# A dictionnary is a simple text file with words. Each line must contain a
# single word
# If no dictionnary is given, just a few default words will be used, and the
# game might be more boring than your statistics' class...

rHangman <- function(dictionnary = "nothing") {
  if (dictionnary == "nothing") {
    dictionnary <- c("it", "is", "just", "a", "flesh", "wound")
  }
  else {
  dictionnary <- readLines(con = dictionnary)
  }
  nTries <- 10
  a <- round(runif(1, min = 1, max = length(dictionnary)))
  word <- dictionnary[a]
  foundLetters <- vector(mode = 'logical', length = nchar(word))
  displayLetters <- rep("_", nchar(word))
  # saidLetters <- vector(mode = 'character')
  saidLetters <- c("aa")
  cat("Word's length is", nchar(word), "characters\n")

  while (nTries != 0) {
    said <- FALSE
    n <- 0
    cat("Letter ? (", nTries, " tries left)\n", sep = "")
    letter <- scan(n=1, what='character', quiet = TRUE)
    for (j in 1:length(saidLetters)) {
      if (saidLetters[j] == letter) said <- TRUE
    }
    if (said == TRUE) {
      cat("The letter", letter, "has already been told!\n")
      cat(displayLetters, "\n")
      nTries <- nTries - 1
      next
    }
    saidLetters <- c(saidLetters, letter)
    for (i in 1:nchar(word)) {
      if (substr(word, i, i) == letter & !foundLetters[i]) {
        foundLetters[i] <- TRUE
        displayLetters[i] <- letter
        n <- n+1
      }
    }
    if (n > 0) {
      cat("The letter", letter, "occurs", n, "times within the word\n")
      cat(displayLetters, "\n")
    }
    if (n == 0) {
      cat("The letter", letter, "doesn't occur within the word\n")
      cat(displayLetters, "\n")
      nTries <- nTries - 1
    };
    if (length(foundLetters[foundLetters == TRUE]) == length(foundLetters)) {
      cat("You got it! It was: ")
      cat(word, "\n")
      break
    }
  }
  if (nTries == 0) {
    cat("You lose! The word was ", word, "\n")
  }
}

# Author: Achal Shah
# Date: 06/27/2016
# Project: Swiftkey word prediction system - NLP
# Task: Implement functions to load and clean the data

#Read files in binary mode
ReadLines.binary <- function(fileName.,encoding.){
  
  # Open file in binary mode
  fileCon = file(fileName.,'rb')
  
  # I used skipnul because in twitter dataset there are few nulls
  data = readLines(fileCon,encoding = encoding.,skipNul = T) 
  
  # Close connection
  close(fileCon)
  
  # Return the data
  return(data)
}

# Sample data
sample.data <- function(data.,proportion){
  
  # Rbinom function is used to sample data
  # It will return data as per proportion argument
  return(data.[as.logical(rbinom(length(data.),1,proportion))])
}

# Clean and tokenize string data
clean.data <- function(data){
  
  # Remove non english characters
  data.cleaned = iconv(data,"latin1","ASCII",sub=" ")
  
  # Create corpus of data
  corpus = Corpus(VectorSource(list(data.cleaned)))
  
  # Remove numbers from the data
  corpus.cl = tm_map(corpus,removeNumbers)
  
  # Remove punctuation from the data
  corpus.cl = tm_map(corpus.cl,removePunctuation)
  
  # Convert all data to lower case
  corpus.cl = tm_map(corpus.cl,content_transformer(tolower))
  
  # Remove stop words from the data
  # corpus.cl = tm_map(corpus.cl,removeWords,stopwords(kind = 'en'))
  
  # Strip whitespaces from the data
  corpus.cl = tm_map(corpus.cl, stripWhitespace)
  
  # Remove profanity words
  # Bad words collection has been taken from public source(Google)
  bad.words = read.delim2("Data/bad_words.txt")
  corpus.cl = tm_map(corpus.cl,removeWords,bad.words[,1])
  
  return(corpus.cl)
}

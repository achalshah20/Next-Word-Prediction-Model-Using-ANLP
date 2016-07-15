# Author: Achal Shah
# Date: 06/27/2016
# Project: Swiftkey word prediction system - NLP
# Task: Load the data and do some basic cleaning like remove punctuation, strip whitespaces etc.

# Load require functions
library(ANLP)

# For debugging purpose
isDebugMode <-  F
isDataPresent <-  F

if(!isDataPresent){

  # Read en.us data
  data.blog <-  readTextFile("data/en_US/en_US.blogs.txt","UTF-8")
  data.twitter <-  readTextFile("data/en_US/en_US.twitter.txt","UTF-8")
  data.news <-  readTextFile("data/en_US/en_US.news.txt","UTF-8")

  # Sample the data
  sample.size <-  0.15

  print("======== Sampling data ========")
  data.blog.sample <-  sampleTextData(data.blog,sample.size)
  data.twitter.sample <-  sampleTextData(data.twitter,sample.size)
  data.news.sample <-  sampleTextData(data.news,sample.size)

  # Create corpus
  library(tm)
  sampled.data <-  c(data.blog.sample,data.twitter.sample,data.news.sample)

  # Save corpus
  writeLines(sampled.data,"output/sample_data.txt")

}else{
  sampled.data <-  readLines("output/sample_data.txt")
}

print("======== Creating and cleaning corpus data ========")
myCorpus <-  cleanTextData(sampled.data)

# Remove profanity words
# Bad words collection has been taken from public source(Google)
bad.words <- readLines("data/bad_words.txt")
bad.words = bad.words %>% tolower() %>% stripWhitespace()
corpus.cl = tm_map(myCorpus,removeWords,bad.words)

writeCorpus(myCorpus,filenames = "output/sample_corpus.txt")

# Create entire corpus
#all.data = c(data.blog,data.twitter,data.news)
#all.cl.corpus =clean.data(all.data)

# Clear the workspace
rm(list = ls())

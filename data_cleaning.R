# Author: Achal Shah
# Date: 06/27/2016
# Project: Swiftkey word prediction system - NLP
# Task: Load the data and do some basic cleaning like remove punctuation, strip whitespaces etc.

# Load require functions
source('func/utility_funcs.R')
source('func/data_analysis_funcs.R')

# For debugging purpose
isDebugMode = F

# Read en.us data
data.blog = ReadLines.binary("data/en_US/en_US.blogs.txt","UTF-8") 
data.twitter = ReadLines.binary("data/en_US/en_US.twitter.txt","UTF-8") 
data.news = ReadLines.binary("data/en_US/en_US.news.txt","UTF-8") 

# Sample the data
sample.size = 0.15

print("======== Sampling data ========")
data.blog.sample = sample.data(data.blog,sample.size)
data.twitter.sample = sample.data(data.twitter,sample.size)
data.news.sample = sample.data(data.news,sample.size)

if(!dir.exists("output/Samples")){
  dir.create("output/Samples")
}

write(data.blog.sample,"output/Samples/sample_blogs.txt")
write(data.twitter.sample,"output/Samples/sample_twitter.txt")
write(data.news.sample,"output/Samples/sample_news.txt")

data.blog.sample = readLines("output/Samples/sample_blogs.txt")
data.twitter.sample = readLines("output/Samples/sample_twitter.txt")
data.news.sample =readLines("output/Samples/sample_news.txt")

# Create corpus
library(tm)
sample.data = c(data.blog.sample,data.twitter.sample,data.news.sample)

print("======== Creating and cleaning corpus data ========")
myCorpus = clean.data(sample.data)

# Save corpus
writeCorpus(myCorpus,filenames = "output/sample_corpus.txt")

# Create entire corpus
#all.data = c(data.blog,data.twitter,data.news)
#all.cl.corpus =clean.data(all.data)

# Clear the workspace
rm(list = ls())
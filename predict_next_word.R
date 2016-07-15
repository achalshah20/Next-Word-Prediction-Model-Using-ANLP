# Author: Achal Shah
# Date: 06/29/2016
# Project: Swiftkey word prediction system - NLP
# Task: Perform predictions on the test data

# Load required libraries and functions
# For dataframe manipulations
library(dplyr)

# NLP library
library(tm)
library(qdap)

# UDF to predict the next word
source("func/predictions_funcs.R")

# For debugging purpose
isDebugMode = F

# Get ngram models for predictions
unigram.df = read.csv("output/models/unigram.csv",stringsAsFactors = F)
bigram.df = read.csv("output/models/bigram.csv",stringsAsFactors = F)
trigram.df = read.csv("output/models/trigram.csv",stringsAsFactors = F)
quadragram.df = read.csv("output/models/quadragram.csv",stringsAsFactors = F)
fivegram.df = read.csv("output/models/fivegram.csv",stringsAsFactors = F)

quadragram.df <- quadragram.df %>% filter(freq > 1)
fivegram.df <- fivegram.df %>% filter(freq > 1)

# List of all the models
modelsList = list(fivegram.df,quadragram.df,trigram.df,bigram.df,unigram.df)

# Predict the next work using backoff method
predict.backoff("Guy at my table's wife got up to go to the bathroom and I asked about dessert and he started telling me about his",modelsList)

# Clear the workspace
#if(!isDebugMode)
  #rm(list = ls())

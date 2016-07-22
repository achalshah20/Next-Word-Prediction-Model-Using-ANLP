# Next word prediction model using ANLP

Next word prediction model is an application which is trained on large amount of text data to predict next word based on previous words. I got the motivation to build this application from SwiftKey  mobile phone application which is doing a similar job but in personalized manner.

**This application was developed in 5 phases:**

1. Data preparation
2. Data cleaning
3. Build model using N-grams
4. Predictions using Backoff algorithm
5. Deployment on shiny server


### 1. Data preparation
Data is the key element of any artificial intelligence application. It is proven that “Data with good quality and quantity usually beats better algorithm”. Data gathering was not a difficult task as I used text data shared by SwiftKey on Coursera data science capstone.

**About data:**
Data was collected from various sources like tweets, blogs and news
It is having 4+ million lines and 100+ million words
Data is in original form so there are many impurities in the data. Data cleaning has to be done before training a model.

### 2. Data cleaning:
Data cleaning is one of the major task and challenge in the area of NLP. Natural language can be written in many forms and everyone uses in different forms 

**Following transformations were applied to clean data:**

* Remove non-English characters
* Remove punctuations
* Remove symbols and numbers
* Convert to lower case
* Replace contractions and abbreviations
* Remove text within brackets
* Remove profanity words

### 3. Modeling using N-grams
In the fields of computational linguistics and probability, an n-gram is a contiguous sequence of n items from a given sequence of text or speech.

I have generated from 1 to 5 gram models.




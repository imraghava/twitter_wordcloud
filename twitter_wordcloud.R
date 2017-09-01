library(twitteR)
library(wordcloud)
library(stringr)
library(wordcloud)
library(tm)

twitter_key<-"KEY"
twitter_secret<-"SECRET"
oauth<-setup_twitter_oauth(twitter_key, twitter_secret, access_token=NULL, access_secret=NULL)

myTweets<-userTimeline("USERNAME", n=NUM_TWEETS)
str(myTweets[[1]])

tweetTexts<-unlist(lapply(myTweets, function(t) { t$text})) 
words<-unlist(strsplit(tweetTexts, " "))
words <- iconv(tweetTexts, 'UTF-8', 'ASCII')
words<-tolower(words)
clean_words<-gsub("http|https|@|#|&amp|.co", "", words)

wordcloud(clean_words, min.freq=2,vfont=c("script", "plain"))


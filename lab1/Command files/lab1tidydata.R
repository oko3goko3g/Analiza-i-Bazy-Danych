billboard <- read.csv(file="C:/Users/KUBA/Desktop/dok8sem/bazy_danych/billboard.csv",stringsAsFactors = FALSE, header=TRUE, sep=",")
billboard

install.packages("dplyr")
install.packages("tidyr")
install.packages("tidyverse")

library(tidyr)
library(dplyr)


rm(list = ls())
library(tibble)
billboard.df <- as_tibble(read.csv("C:/Users/KUBA/Desktop/dok8sem/bazy_danych/billboard.csv", stringsAsFactors = FALSE))
head(billboard.df)

library(tidyverse)

names(billboard.df)[8:83]<-gsub(".week","",colnames(billboard.df[,8:83]))
names(billboard.df)[8:83]<-gsub('.{-2}.$','',colnames(billboard.df[,8:83]))
names(billboard.df)[8:83]<-gsub('x','wk',colnames(billboard.df[,8:83]))
names(billboard.df)

names(billboard.df)[2] <- "artist"

billboard.newdf <- billboard.df %>% gather(week, rank, wk1:wk76, na.rm = TRUE)
billboard.newdf <- arrange(billboard.newdf, year, artist, track)

billboard <- billboard.newdf %>% mutate(
  week = parse_number(week),
  date = as.Date(date.entered) + 7*(week - 1))

billboard <- billboard[c("year", "artist", "time", "track", "date", "week", "rank")]
billboard
write.csv(billboard,"C:/Users/KUBA/Desktop/dok8sem/bazy_danych/billboard2.csv", row.names = FALSE)

#Song Table
song <- billboard %>% select(artist, track, year, time) %>% unique()
song$song_id <- 1:nrow(song)
head(song)

write.csv(song,"C:/Users/KUBA/Desktop/dok8sem/bazy_danych/song.csv", row.names = FALSE)


rank <- left_join(billboard, song, match = "first")
rank <- rank[c("song_id","week", "date", "rank")]
rank <- arrange(rank, song_id, date)
rank$rank_id <- 1:nrow(rank)
rank
write.csv(rank,"C:/Users/KUBA/Desktop/dok8sem/bazy_danych/rank.csv", row.names = FALSE)


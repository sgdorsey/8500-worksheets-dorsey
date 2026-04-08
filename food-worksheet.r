# ==============================================================================
# IN-CLASS ACTIVITY: Food Vocabulary in Post-WWII Germany
# ==============================================================================
# These bulletins document U.S. occupation policy in Germany, 1949-1952. 
# Your goal: explore how food appears in these official publications.

# ------------------------------------------------------------------------------
# SETUP (5 minutes)
# ------------------------------------------------------------------------------

library(tidyverse)
library(tidytext)
library(readtext)

# Download and load the data
download.file("https://github.com/regan008/8510-TextAnalysisData/raw/refs/heads/main/InfoBulletin.zip", "InfoBulletin.zip")
unzip("InfoBulletin.zip")

metadata <- read.csv("https://raw.githubusercontent.com/regan008/8510-TextAnalysisData/refs/heads/main/ib-metadata.csv")
bulletins <- readtext(paste(getwd(), "/InfoBulletin/*.txt", sep=""))

# Join them together
ib <- bulletins %>%
  left_join(metadata, by = c("doc_id" = "filename"))


# ------------------------------------------------------------------------------
# TASK (15-20 minutes)
# ------------------------------------------------------------------------------

# STEP 1: Tokenize and remove stopwords
ib_words <- ib %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)


# STEP 2: Create a list of food-related terms and filter for them
food_terms <- c("food", "agriculture", "crops", "wheat", "grain", "rations", 
                "hunger", "harvest", "livestock", "feed", "shortage", "famine", "pasta")

food_words <- ib_words %>%
  filter(word %in% food_terms)


# STEP 3: Visualize food vocabulary over time
food_words %>%
  count(year, word) %>%
  ggplot(aes(x = year, y = n, fill = word)) +
  geom_col() +
  labs(title = "Food Terms in Information Bulletins, 1949-1952")


# STEP 4: Find what words appear near food terms (bigrams)
ib %>%
  unnest_tokens(bigram, text, token = "ngrams", n = 2) %>%
  separate(bigram, into = c("word1", "word2"), sep = " ") %>%
  filter(word1 %in% food_terms | word2 %in% food_terms) %>%
  count(word1, word2, sort = TRUE) %>%
  head(15)


# ------------------------------------------------------------------------------
# DISCUSSION (10 minutes)
# ------------------------------------------------------------------------------
# Based on your findings:
#
# 1. Does food vocabulary increase or decrease over time? Why might that be?
#
# 2. What words appear alongside food terms? What does this reveal about how 
#    the U.S. occupation forces talked about food?
#
# 3. How might food have functioned as a diplomatic tool in the early Cold War?
#
# [Space for notes below]
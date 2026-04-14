
library(tidyverse)
library(tidytext)
library(topicmodels)
library(tm)



# Create our tiny corpus - with repeated words and mixed content
pet_corpus <- data.frame(
  doc_id = c("doc1", "doc2", "doc3", "doc4", "doc5", "doc6"),
  text = c(
    "dog bark bark fetch ball tail wag play dog fetch",
    "cat meow purr purr whiskers litter scratch cat meow",
    "bird chirp sing cage feather fly bird chirp sing",
    "dog puppy bark bark tail play fetch wag dog",
    "cat kitten meow purr scratch litter kitten cat purr",
    "dog bark play ball fetch and cat meow purr litter"  # Mixed document!
  )
)

# Tokenize and create document-term matrix
pet_dtm <- pet_corpus %>%
  unnest_tokens(word, text) %>%
  count(doc_id, word) %>%
  cast_dtm(doc_id, word, n)

# Run LDA with k=3 topics (we suspect dogs, cats, birds)
pet_lda <- LDA(pet_dtm, k = 3, method = "Gibbs", 
               control = list(seed = 123456, iter = 2000, burnin = 1000))


pet_topics <- tidy(pet_lda, matrix = "beta")

# Get top words for each topic
x <- pet_topics %>%
  group_by(topic) %>%
  top_n(5, beta) %>%
  arrange(topic, desc(beta))



# Visualize the topics
pet_topics %>%
  group_by(topic) %>%
  top_n(5, beta) %>%
  ungroup() %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(beta, term, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  scale_y_reordered() +
  labs(title = "Top Words in Each Topic",
       x = "Beta (word-topic probability)",
       y = NULL)


pet_docs <- tidy(pet_lda, matrix = "gamma")

pet_docs %>%
  arrange(document, topic)

pet_docs %>%
  mutate(topic = factor(topic)) %>%
  ggplot(aes(x = document, y = gamma, fill = topic)) +
  geom_col() +
  labs(title = "Document Composition by Topic",
       y = "Proportion (gamma)",
       x = "Document") +
  theme_minimal()


# ==============================================================================
# Am City Demo
# ==============================================================================

# Download the data
download.file("https://github.com/regan008/8510-TextAnalysisData/blob/main/TheAmericanCity.zip?raw=true", 
              "AmCity.zip")
unzip("AmCity.zip")

metadata <- read.csv("https://raw.githubusercontent.com/regan008/8510-TextAnalysisData/main/AmCityMetadata.csv")

# Load and prepare the texts
library(readtext)
ac_texts <- readtext(paste("TheAmericanCity/", "*.txt", sep=""))
ac_whole <- full_join(metadata, ac_texts, by = c("filename" = "doc_id"))

# Tokenize and clean (same as last week)
tidy_ac <- ac_whole %>%
  unnest_tokens(word, text) %>% 
  filter(str_detect(word, "[a-z']$")) %>%  # Keep only words
  anti_join(stop_words) %>%                # Remove stopwords
  filter(!grepl('[0-9]', word))            # Remove numbers

# Create DTM (this is what LDA needs)
ac_dtm <- tidy_ac %>% 
  count(filename, word) %>%
  cast_dtm(filename, word, n)


# ==============================================================================
# FIT THE MODEL
# ==============================================================================

# Start with k=5 topics
ac_lda <- LDA(ac_dtm, 
              k = 5, 
              method = "Gibbs",
              control = list(seed = 12345, iter = 2000, burnin = 1000))

# ==============================================================================
# EXAMINE THE TOPICS (BETA)
# ==============================================================================

ac_topics <- tidy(ac_lda, matrix = "beta")

# Top 10 words per topic
ac_top_terms <- ac_topics %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, desc(beta))

print(ac_top_terms)

# Visualize
ac_top <- ac_topics %>%
  group_by(topic) %>%
  top_n(8, beta) %>%
  ungroup() %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(beta, term, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  scale_y_reordered() +
  labs(title = "Top Words in American City Topics")
ggsave(ac_top, "ac_top.png")

# ==============================================================================
# TOPICS OVER TIME (GAMMA)
# ==============================================================================

ac_docs <- tidy(ac_lda, matrix = "gamma")
 
# Join with metadata to get dates
topics_by_time <- ac_docs %>%
  left_join(metadata, by = c("document" = "filename"))
 
# Let's try plotting topic prevalence over time
topics_by_time %>%
  mutate(issue_date = paste(month, year, sep = " ")) %>%
  ggplot(aes(x = issue_date, y = gamma, group = topic, color = factor(topic))) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  facet_wrap(~ topic, scales = "free_y") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
  labs(title = "Topic Prevalence Over Time (PROBLEM VERSION)",
       x = "Issue",
       y = "Proportion (gamma)",
       color = "Topic")

 
# Let's fix the metadata:
metadata <- metadata %>%
  mutate(date = as.Date(paste(year, month, "01", sep = "-"), format = "%Y-%B-%d")) %>%
  arrange(date)
 
# Now rejoin with the sorted metadata:
topics_by_time <- ac_docs %>%
  left_join(metadata, by = c("document" = "filename"))
 
# Plot again with the proper date:
topics_by_time %>%
  ggplot(aes(x = date, y = gamma, group = topic, color = factor(topic))) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  facet_wrap(~ topic, scales = "free_y") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)) +
  labs(title = "Topic Prevalence Over Time (FIXED)",
       x = "Date",
       y = "Proportion (gamma)",
       color = "Topic")


# ==============================================================================
# EXPERIMENTING WITH K
# What if we try different numbers of topics?
# ==============================================================================

# Try k=3 (fewer topics)
ac_lda_3 <- LDA(ac_dtm, k = 5, method = "Gibbs",
                control = list(seed = 12345, iter = 2000, burnin = 1000))

tidy(ac_lda_3, matrix = "beta") %>%
  group_by(topic) %>%
  top_n(8, beta) %>%
  ungroup() %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(beta, term, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  scale_y_reordered() +
  labs(title = "With k=3 topics")


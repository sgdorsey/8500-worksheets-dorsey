

library(DigitalMethodsData)
data(BostonWomenVoters)

for (i in 1:nrow(BostonWomenVoters)){
if (BostonWomenVoters$Occupation[i] == "Housewife") {
  print(paste("BostonWomenVoters$Name[i])","is a housewife"))
} else if (BostonWomenVoters$Occupation[i] == "Stenographer") {
  print("this woman is a stenographer")
} else {
  print("this woman is neither")
}
}

journals <- data.frame(
  title = c("AHR", 
            "JAH",
            "WMQ",
            "AHR",
            "JSH"),
  month = c("January", "March", "April", "July", "October"),
  year = c(1920, 1920, 1920, 1921, 1921)
)

#AHR-January-1920.txt "A profound historical source"

writeLines("A profound historical source", "AHR-January-1920.txt")
for (i in 1:length(journals$title)){
  writeLines("A profound historical source", paste(journals$title[i], journals$month[i], journals$year[i], ".txt", sep="-"))
}



paste(journals$title[1], journals$month[1], journals$year[1], ".txt", sep="-")

install.packages("tidyverse")


library(tidyverse)
library(DigitalMethodsData)
data(gayguides)
#select
s.gayguides <- gayguides %>% select(title, Year)
#to grab everything except the city and state column
s.gayguides <- gayguides %>% select(-city, -state)
#range of columns
s.gayguides <- gayguides %>% select(ID:state)

#filter - you can use logical values in here
s.gayguides <- gayguides %>% filter(state == "SC" & Year == "1975")
#can also do a range like in subsetting
s.gayguides <- gayguides %>% filter(Year >= "1970" & Year <= "1975")

#mutate - great to use when geocoding because you need one set of values - first thing after the mutate is the new column
s.gayguides <- gayguides %>% mutate(location = paste(city, state, sep=", "))
s.gayguides <- gayguides %>% mutate(decade = floor(Year/10)*10)
#always check with unique()

#arrange - sorts
s.gayguides <- gayguides %>% arrange(Year)
s.gayguides <- gayguides %>% filter(state == "SC") %>% arrange(desc(Year))
s.gayguides <- gayguides %>% arrange(state, Year)

#group_by + summarize - always paired together
s.gayguides <- gayguides %>% group_by(state) %>% summarize(count = n())
s.gayguides <- gayguides %>% group_by(state) %>% summarize(count = n()) %>% arrange(count)
# you could see how many locations were in each year in each state by adding Year after state

#recdata example
#screcdata <- rec_data %>% filter(state == "SC")
#screcdata <- rec_data %>% filter(state == "SC") %>% select(city, total_expenditures) %>% arrange(desc(total_expenditures))

rec_data <- rec_data %>% mutate(spending_per_capita = floor(total_expenditures/population)) %>% arrange(desc(spending_per_capita))
bigpopulation <- rec_data %>% filter(population > 50000 & total_expenditures>25000) 

#argument: city
#filters gayguides to show only those cities

gayguides %>% 
  filter(city == "Atlanta")


cityfind <- function(d.city) {
  gayguides %>% filter(d.city == city) %>% summarize(numofloc = n())
}
Atlantalocations <- cityfind("Atlanta")


#March 2 2026
library(tidyverse)
library(DigitalMethodsData)
library(forcats)
data(BostonWomenVoters)

test <- BostonWomenVoters %>% mutate(occupation_lumped = fct_lump(Occupation, n=5))
domesticwork <- BostonWomenVoters %>% mutate(occupationgroup = fct_collapse(Occupation, "Domestic Work" = c("Housewife", "At Home")))
slave.state.status <- slave.state.status %>% mutate(State = paste(state))
statetype <- left_join(fugitive.slave.data, slave.state.status, by = "State")
typegroup <- statetype %>% group_by(status) %>% summarize(count = n())

statetype <- statetype %>% mutate(location = paste(City,state,sep = ", "))

#March 4 26
#start with dataset you want the rows moved into
demo <- guinness_belfast_sales %>% left_join(guinness_belfast_accounts, by= c("account_id" = "account.id"))
#if the account id columns were the same, you just put the column. If not, you have to tell it which one is equal

#Pivot wider and longer
library(tidyr)
sc.parks <- read.csv("https://raw.githubusercontent.com/regan008/DigitalMethodsData/main/raw/RecreationData-Wide.csv")
head(sc.parks)
#tidy dataframes are long
# the ! is what you don't want it to mess with.
sc.parks <- sc.parks %>%
  pivot_longer(!city:type_of_worker, names_to = "year", values_to = "count")
# this takes the columns and turns them into rows (it should add rows)
sc.parks <- sc.parks %>%
  pivot_wider(names_from = year, values_from = count)
#for pivot wider, you don't have to tell it what you don't want

#March 9
#AI coding tools
#Copilot sources from your files
#you can ask it "I don't understand the code on lines 28-29, explain it to me"
#can only be used as a tool (why your code didn't work, how to do something, etc.) - not analysis
#you have to be able to explain every code you create
#look up the functions you don't understand
#test each piece separately (recommend not using agent mode - it does stuff for you)
#add comments on it yourself
#keep questions small and specific
#never trust the code until you test it
#helps with syntax, debugging
#keep notes for what you ask it and what it gives you - could be useful down the road
#you can use it to whatever level you feel comfortable with - you do not have to use AI on the log
#on the auto settings, don't use GPT models
#claude code - requires a subscription, but scary code
#cursor - requires a subscription, but good for significant digital components for dissertation, free for students for just one year, heavily built on anthropics models


#March 30 - Charts
library(tidyverse)
library(DigitalMethodsData)
library(ggplot2)
data(gayguides)

ggplot(data = gayguides, mapping = aes(x = Year)) + geom_histogram(bins = 30, fill="steelblue", color="white")

#group by number of locations per year
ggyearly <- gayguides %>% group_by(Year) %>% summarize(count = n())
ggplot(data = ggyearly, map = aes(x= Year, y=count)) + geom_point()
#line chart
ggplot(data = ggyearly, map = aes(x= Year, y=count)) + geom_line()
#combined
ggplot(data = ggyearly, map = aes(x= Year, y=count)) + geom_line() + geom_point()
#line charts in this example are more effective because they show growth
#color
#plot the top three states
top_states <- gayguides %>% count(state, sort=TRUE) %>% head(3) %>% pull(state)
gg_states <- gayguides %>% filter(state %in% top_states) %>% group_by(Year, state) %>% summarize(count=n())
ggplot(data=gg_states, mapping=aes(x=Year, y=count, color=state)) + geom_line() + geom_point()

#faceting - creates multiple minis of the same data
ggplot(data = gg_states, mapping = aes(x=Year, y=count)) + geom_line() + facet_wrap(~ state)
#works great for topic modeling - different topics across time
#facet_wrap doesn't take into consideration the axis
#**facet_grid** standardizes the axis
ggplot(data = gg_states, mapping = aes(x=Year, y=count)) + geom_line() + facet_wrap(state ~ .)

#gayguides, type
gg_1980 <- gayguides %>% filter(Year == 1980) %>% separate_rows(type, sep=", ") %>% count(type, sort=TRUE) %>% head(10)
ggplot(data = gg_1980, mapping = aes(x=type, y=n)) + geom_col()
#makes the chart, but it's messy and jumbled
ggplot(data = gg_1980, mapping = aes(x=type, y=n)) + geom_col() + coord_flip()
ggplot(data = gg_1980, mapping = aes(x=reorder(type, n), y=n)) + geom_col()
#top 5 types in CA and NY
gg_compare <- gayguides %>% filter(state %in% c("CA", "NY", Year >= 1970)) %>% separate_rows(type, sep=", ") %>% group_by(state, type) %>% summarize(count=n(), .groups="drop") %>% group_by(state) %>% slice_max(count, n=5) %>% ungroup()
#pulls the top 5 from each state
ggplot(data = gg_compare, mapping = aes(x=type, y=count, fill=state)) + geom_col()
#show them next to each other
ggplot(data = gg_compare, mapping = aes(x=type, y=count, fill=state)) + geom_col(position = "dodge")
#changing dodge to fill will show the proportions
#add labels, themes, colors, font size, etc.
ggplot(data = gg_compare, mapping = aes(x=type, y=count, fill=state)) + geom_col(position = "dodge") + labs(title = "Top 5 location types in NY and CA", x="Number of Locations", y="Type of Location", caption="Source:Mapping the Gay Guides") + theme(plot.title = element_text(size=16, face="bold"))
#ggsave = save it, and you have options to change DPI


#April 6 2026
library(tidyverse)
install.packages("tidytext")
install.packages("readtext")
install.packages("widyr")
install.packages("SnowballC")
#text analysis - text must be converted into numbers - specifically vectors of numbers
#vectors are derived from textual data to reflect various linguistic properties
#tiny corpus
tiny_corpus %>%
  unnest_tokens(word, text) %>%
#word is the column name, text is where it's pulling from
  anti_join(stop_words) %>%
  count(doc_id, word, sort = TRUE) %>%
  #produces a column n, which is the count
  pivot_wider(names_from = word, values_from = n, values_fill = 0)
  #taking out values_fill gives NA values
  #we're using the standard stopword list, but there are historical ones for other groups
  #anti_join with stopwords removes common words
tiny_corpus %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words) %>%
  count(doc_id, word) %>%
  bind_tf_idf(word, doc_id, n) %>%
  arrange(desc(tf_idf))

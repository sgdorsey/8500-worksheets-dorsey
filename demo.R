

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


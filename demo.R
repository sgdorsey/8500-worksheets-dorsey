

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

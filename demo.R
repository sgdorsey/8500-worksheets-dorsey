

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




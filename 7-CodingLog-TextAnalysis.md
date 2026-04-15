# Week [7] Learning Log

**Student Name:** [Sharon Dorsey]  
**Week of:** [4/6/26]  
**Topic(s):** [e.g., "Text Analysis"]

---

## What I Worked On This Week

**Assignment(s):**
- [ ] Worksheet [#7]
- [ ] Other: [describe]

**AI tools used this week:**
- [ ] ChatGPT
- [x] Claude
- [ ] GitHub Copilot
- [ ] Other: [specify]
- [ ] Did not use AI this week

---

## Challenges & Problem-Solving

### Challenge 1: Reading in the text

**What I was trying to do:**
I was trying to read in the text of The Women Citizen.

**What went wrong:**
I kept getting an unexpected symbol in the code, it gave me an invalid zip name argument, etc.


**Did you use AI to troubleshoot this challenge?** Yes

---

#### If YES, I used AI:

**My prompt to AI:**
```
On line 477 and 478, I continually get an invalid zip name argument.
THEN
How would I read the files in the zip folder into the global workspace
```

**AI's response:**
```r
#The original response told me to add the .zip extension, but didn't fix the problem, so I reworded the prompt to be more specific. This is the response to the second prompt.

The worksheet already uses readtext(). After unzipping, TheWomanCitizen.zip will extract to a folder called TheWomanCitizen/. You can read all the .txt files from it the same way line 411 does for the txt/ folder. Replace the placeholder readfile on line 484 with:

twc <- readtext(paste(getwd(), "/TheWomanCitizen/*.txt", sep=""))

```

**How I evaluated the AI's suggestion:**

**What I implemented and why:**
All parts were appropriate.

**What I modified and why:**
I copied and pasted this line of code into the worksheet, and then broke it down into pieces to make sure I understood it. This line mimicked a line earlier in the worksheet, but I just could not figure out the right way to type it without it giving me an error message.

**What I rejected and why:**
N/A

**Additional resources I consulted:**
- [x] Documentation for [readtext]
- [ ] Stack Overflow: [describe]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [x] Other: [I googled this heavily.]


echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
---

**Resolution:**
The suggestion from Claude Code worked and I just needed to rewrite the code to read it in.

**What I learned:**
AI did help my understanding, especially when it came to the parts of the code to read in files from a .zip folder.

**Verification:**
I ran it, then compared the files in the Global environment to the number of observations in the metadata. Since they were the same and there were not any duplicates, I knew it worked correctly.

---

### Challenge 2: Left Join Issues

**What I was trying to do:**
I was trying to do a left join with the metadata and the text column for The Woman Citizen.

**What went wrong:**
I could not get the join to include the text at all (but I did fix that separately), then I kept getting the error: "Filename not found."

**Did you use AI to troubleshoot this challenge?** Yes

---

#### If YES, I used AI:

**My prompt to AI:**
```
Why is the left join on line 507 not working
```

**AI's response:**
```r
#Problem 1: twc_tidy's column was filename, but the code block had "Filename" two lines down so it was case sensitive.
#Problem 2: the left_join was included in a pipe, so the original code wanted to try and join a piped data frame, twc_tidy, and metadata by the "filename" column (making it 4 arguments) but the left_join() only has 3 arguments, not four. Claude wanted me to 
twc_idf <- twc_tidy %>%
  count(filename, word, sort=TRUE) %>%
  bind_tf_idf(word, filename, n) %>%
  arrange(desc(tf_idf)) %>%
  mutate(month = str_extract(filename, "^[A-Za-z]+")) #to extract the part of the file name that had letters in order to create a new column for months so I could sort and filter the data again.

head(twc_idf, n=10)
```

**How I evaluated the AI's suggestion:**

**What I implemented and why:**
I fixed the capitalization error, which did fix that. 
**What I modified and why:**
I added mutate(filename = str_remove_all(doc_id, "MB_")) in the twc dataframe, arranged each dataframe in descending order, then did a left_join as usual. For the twc_idf dataframe, I put the line to filter to a certain month at the beginning of the code block instead of at the end, which worked.

**What I rejected and why:**
I did not use the str_extract command, since I realized that there was an easier way to do this if I looked at the doc_id and created a new column for filename that dropped "_MB" in each doc_id.

**Additional resources I consulted:**
- [ ] Documentation for [package/function]
- [ ] Stack Overflow: [describe]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [ ] Other: [describe]

---

---

**Resolution:**
Ultimately, the AI suggestion worked when I made a new column in the twc dataframe that matched metadata's filename set up, then fixed a capitalization mismatch.

**What I learned:**
It taught me that sometimes the AI gives me suggestions I don't understand and might honestly be harder to work with. Now I have a column with the month in that dataframe which could be helpful.
**Verification:**
I tried them both and then viewed each dataset to make sure everything joined properly and was filtered correctly.
---

## Reflection

**What I understand well now:**
I think the process of tf-idf is clear.
**What I'm still confused about:**
I don't think I'm confused about it, but figuring out how to work around OCR errors is frustrating. I also wonder how large the tf-idf value needs to be for it to be significant?

**How AI affected my learning this week:**
AI did help by explaining exactly what the problem was with my syntax, though it did want to add in code I wasn't familiar with and therefore I decided not to use.

**Evolving AI strategy:**
Giving it specific examples of the error code or what I've already done seems to work best. Telling it to explain the process of what went wrong has helped me learn where the issue was at/

**Connection to historical research:**
I could see myself using tf-idf in denominational newspapers, since I frequently work with those, so I think I would use this extensively.

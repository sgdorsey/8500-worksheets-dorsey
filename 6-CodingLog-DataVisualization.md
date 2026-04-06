# Week [X] Learning Log

**Student Name:** [Sharon Dorsey]
**Week of:** [4/6/26] 
**Topic(s):** [e.g., "Data Visualization"]

---

## What I Worked On This Week

**Assignment(s):**
- [ ] Worksheet [6]
- [ ] Other: [describe]

**AI tools used this week:**
- [ ] ChatGPT
- [ ] Claude
- [ ] GitHub Copilot
- [ ] Other: [specify]
- [x] Did not use AI this week

---

## Challenges & Problem-Solving

### Challenge 1: [Finding the average number of volunteer and paid workers over time]

**What I was trying to do:**
When I would try to run the ggplot to show the average number of volunteer and paid workers over time with a facet wrap, I would constantly get an error code and nothing would show up.
**What went wrong:**
Error: Each group consist of only one observation. Do you need to adjust the group aesthetic?

**Did you use AI to troubleshoot this challenge?** [Yes / No]
No
---

#### If YES, I used AI:

**My prompt to AI:**
```
[Copy your exact prompt here]
```

**AI's response:**
```r
# Paste the relevant code or explanation AI provided -- this can brief and abbreviated or summarized if the response is long.
```

**How I evaluated the AI's suggestion:**

**What I implemented and why:**
[Which parts of the AI's suggestion were appropriate?]

**What I modified and why:**
[What did you change? Why was the change necessary?]

**What I rejected and why:**
[What suggestions did you not use? Why were they inappropriate?]

**Additional resources I consulted:**
- [ ] Documentation for [package/function]
- [ ] Stack Overflow: [describe]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [ ] Other: [describe]


echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
---

#### If NO, I didn't use AI:

**Why I chose not to use AI:**
I didn't think I needed it - I thought this was a problem that could be solved by searching it on the web.

**My problem-solving process:**
1. I googled it and added group=1 to the aesthetics - this worked.
2. group_by(type_of_worker, year) %>% summarize(count = mean(count, na.rm = TRUE)) %>% mutate(year = as.numeric(gsub("X", "", year))) - once I added this and deleted the group = 1 in aesthetics, this worked as well.
3. [Additional attempts if relevant]

**Resources I consulted:**
- [ ] Documentation for [package/function]
- [ ] Stack Overflow: [describe what you searched for]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [x] Other: [tech table]

---

**Resolution:**
Adding group=1 forced it to work or making the year run as.numeric worked too.
**What I learned:**
I learned more about the type of values in VS code - namely about numeric values and how to convert a value to a numeric one so code will run.
**Verification:**
[How did you verify the code worked correctly? What did you test?]

---

### Challenge 2: [Chart 5 locations]

**What I was trying to do:**
I was trying to chart 5 types of locations in the gayguides data between 1965 and 1980.
**What went wrong:**
When I was trying to filter the data, I continuously kept getting errors and warnings about unexpected " in the line of code.
**Did you use AI to troubleshoot this challenge?** [Yes / No]
No
---

#### If YES, I used AI:

**My prompt to AI:**
```
[Copy your exact prompt here]
```

**AI's response:**
```r
# Paste the relevant code or explanation AI provided -- this can brief and abbreviated or summarized if the response is long.
```

**How I evaluated the AI's suggestion:**

**What I implemented and why:**
[Which parts of the AI's suggestion were appropriate?]

**What I modified and why:**
[What did you change? Why was the change necessary?]

**What I rejected and why:**
[What suggestions did you not use? Why were they inappropriate?]

**Additional resources I consulted:**
- [ ] Documentation for [package/function]
- [ ] Stack Overflow: [describe]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [ ] Other: [describe]

---

#### If NO, I didn't use AI:

**Why I chose not to use AI:**
I figured it was a syntax problem, so I probably needed to look at what I typed again.

**My problem-solving process:**
1. [filter(type == "Hotels| type == "Baths"| type == "Business,Erotic Shop"| type == "Health Clinic"| type == "Gym")] - I counted the quotation marks and read it carefully, then added " after Hotels. This worked
2. [Second attempt - what you did and what happened]
3. [Additional attempts if relevant]

**Resources I consulted:**
- [ ] Documentation for [package/function]
- [ ] Stack Overflow: [describe what you searched for]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [x] Other: [I went through, slowed down, and read what I typed again.]

---

**Resolution:**
Adding the quotation marks in the correct place fixed it.
**What I learned:**
I didn't really learn anything, but I did remember I had to slow down again.

**Verification:**
[How did you verify the code worked correctly? What did you test?]

---

## Reflection

**What I understand well now:**
I found ggplot very easy to use.

**What I'm still confused about:**
I don't understand some of the plots like the violin plot or the different types of dot plots.
**How AI affected my learning this week:**
[Did AI help you understand concepts better? Did it create confusion? Did it save time or create new problems? Be specific.]

**Evolving AI strategy:**
[How are you getting better at using AI? What have you learned about when/how to use it effectively? What prompting strategies are working?]

**Connection to historical research:**
I will use ggplot extensively in my research to make visualizations, especially regarding change over time.

# Week [X] Learning Log

**Student Name:** Sharon Dorsey
**Week of:** 3/9  
**Topic(s):** Advanced Data Manipulation

---

## What I Worked On This Week

**Assignment(s):**
- [ ] Worksheet [#]
- [ ] Other: [describe]

---

## Challenges & Problem-Solving

### Challenge 1: [How many bars when filtered by state and type]

**What I was trying to do:**
The task was to group the gayguides data by state and type, count the number of locations in each type, then figure out which state had the most bars.

**What went wrong:**
I kept getting errors regarding my filter command. It kept giving me the message "'..1' must be of size 18 or 1, not size 1851.
**My problem-solving process:**
1. I tried retyping my grepl command, redoing the syntax by changing the subset from the gayguides data to the new variable's data, and using grep instead of grepl - I got the same error message.
2. I moved the filter command (filter(grepl("Bar", gayguides$type)) to be the first command in the chain - that worked.
3. [Additional attempts if relevant]

**Resources I consulted:**
- [x] Documentation for [grep/grepl]
- [ ] Stack Overflow: [describe what you searched for]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [x] Other: [googled the error message.]

**Resolution:**
Moving the filter around worked.

**What I learned:**
I need to use grepl prior to changing anything major with the dataframe itself, I think. If not, the computer gets confused on the column names, possibly.
---

### Challenge 2: LGBTQ life growth

**What I was trying to do:**
The task was to create a data frame that computes the growth in LGBTQ life in every state from 1970 to 1980
**What went wrong:**
I did not know how to make a new column that also computed the difference.
**My problem-solving process:**
1. I filtered the data to any year between 1970-1980, then realized I actually only needed the numbers for 1980 and 1970.
2. I filtered the data to 1970 and 1980, then grouped it by state and year, then summarized the totals. After this, I knew I needed to calculate the difference somewhere, but I wasn't sure where.
3. I searched online and tried the lag() command, which appears to have worked.

**Resources I consulted:**
- [x] Documentation for [lag()]
- [x] Stack Overflow/Google: "how to find the difference between values associated with years in r"
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [ ] Other: [describe]

**Resolution:**
Using mutate to create a new column where the difference was computed with lag() worked. Still confused on the regions portion of the question but that's because I don't think I did something correctly earlier.
**What I learned:**
I learned how to use lag().

---

### Challenge 3 (Optional): [Brief descriptive title]

**What I was trying to do:**
[Describe the task or problem]

**What went wrong:**
[Describe the error, confusion, or roadblock]

**My problem-solving process:**
1. [First attempt - what you did and what happened]
2. [Second attempt - what you did and what happened]
3. [Additional attempts if relevant]

**Resources I consulted:**
- [ ] Documentation for [package/function]
- [ ] Stack Overflow: [describe what you searched for]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [ ] Other: [describe]

**Resolution:**
[What ultimately worked or where you're still stuck]

**What I learned:**
[What did this teach you about the concept, the tool, or problem-solving?]

---

## Reflection

**What I understand well now:**
I'm getting a lot better at using the tidyverse and I'm more confident with larger and longer codes.

**What I'm still confused about:**
Nothing is necessarily unclear, but I do think the for/if/else loop I wrote in the question about intervals was trying to break my computer.

**Connection to historical research:**
I will definitely use the tidyverse commands to clean up data that might be messy by fixing dates or standardizing entries (I could see this being particularly useful when I am dealing with multiple denominations that are not always recorded the same way). Being able to put churches into groups (liturgical churches, non-liturgical churches, Pentecostal churches, etc.) would also be helpful and could be accomplished efficiently through the tidyverse commands of fct_collapse and lump.


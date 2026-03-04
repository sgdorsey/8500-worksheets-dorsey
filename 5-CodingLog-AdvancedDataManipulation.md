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

### Challenge 2: [Brief descriptive title]

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
[What clicked for you this week?]

**What I'm still confused about:**
[What remains unclear? What questions do you have?]

**Connection to historical research:**
[How might this week's skills apply to your research?]



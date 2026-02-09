# Week [X] Learning Log

**Student Name:** Sharon Dorsey 
**Week of:** 2/9
**Topic(s):** Data Structures

---

## What I Worked On This Week

**Assignment(s):**
- [ ] Worksheet [2]
- [ ] Other: [describe]

---

## Challenges & Problem-Solving

### Challenge 1: Finding SC Titles

**What I was trying to do:**
I was trying to find all the titles of locations in South Carolina in the gayguides data.

**What went wrong:**
I couldn't figure this out. I tried searching, etc.

**My problem-solving process:**
1. I honestly don't remember what I tried at first.
2. gayguides[gayguides$state == "South Carolina" & gayguides$title] - error message about invalid input somewhere in the string
3. [sclocations<- gayguides[gayguides$state == "South Carolina",]
sclocations$title - gave me something but unsure if it's correct

**Resources I consulted:**
- [ ] Documentation for [package/function]
- [x] Stack Overflow: [how to subset a column in r with $ and [], how to subset to show column and row conditions r, how to find all instances of a state in a given column]
- [ ] Course materials: [which ones]
- [x ] Slack discussion
- [ ] Office hours
- [x] Other: [Google - I consulted a lot of sources. Also consulted the tech table.]

**Resolution:**
[What ultimately worked or where you're still stuck]

**What I learned:**
[What did this teach you about the concept, the tool, or problem-solving?]

---

### Challenge 2: [Brief descriptive title]

**What I was trying to do:**
On the last question, I kept getting the wrong output.
**What went wrong:**
order(BostonWomenVoters$Age)
womenorder<-BostonWomenVoters[order(BostonWomenVoters$Age, decreasing = TRUE), ]$Occupation
tail(womenorder)
I kept running this code and checking it with the view finder, and it wasn't working.
**My problem-solving process:**
1. I ran it a couple of times like this and pulled the documentation on the tail function to see if I wasn't using it right.
2. I reran the code piece by piece and realized that I had ordered the data from oldest to youngest and then was asking it to give me the last six entries, so effectively asking for the youngest women. I changed the last line to head(womenorder) and that worked.
3. [Additional attempts if relevant]

**Resources I consulted:**
- [ x] Documentation for [tail]
- [ ] Stack Overflow: [describe what you searched for]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [ ] Other: [describe]

**Resolution:**
Switching the function to head(womenorder) worked.

**What I learned:**
Reading the code line by line and taking my time would be helpful, especially if I'm coming back to it a day later.

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
Nothing clicked per se, but I understand how to use the subsetting and order functions and I just need to practice more. 
**What I'm still confused about:**
How would you subset a matrix when the two columns are nonadjacent?
**Connection to historical research:**
I think subsetting will be incredibly important, especially when I'm comparing denominations of churches, etc.


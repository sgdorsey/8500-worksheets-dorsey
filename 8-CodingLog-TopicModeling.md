# Week [8] Learning Log

**Student Name:** [Sharon Dorsey]  
**Week of:** [4/15/26]  
**Topic(s):** [e.g., "Topic Modeling"]

---

## What I Worked On This Week

**Assignment(s):**
- [ ] Worksheet [8]
- [ ] Other: [describe]

**AI tools used this week:**
- [ ] ChatGPT
- [ ] Claude
- [ ] GitHub Copilot
- [ ] Other: [specify]
- [ ] Did not use AI this week

---

## Challenges & Problem-Solving

### Challenge 1: [Topic Model Number]

**What I was trying to do:**
I was trying to write descriptive titles for the 5 topics from the American City.

**What went wrong:**
The topic model returned 5 topics that were literally the same words in different orders. When I tried to change the document number, this problem persisted.

**Did you use AI to troubleshoot this challenge?** [No]

---

#### If NO, I didn't use AI:

**Why I chose not to use AI:**
I felt like this was a problem I just needed to play with, but not something I needed AI for. I wanted to figure out how to tell for myself if the topic number was right.
**My problem-solving process:**
I added "american" and "city" to the stopwords list so it would remove those.
1. I tried the model with 2, 3, 4, 5, 15, 25, and 30 topics. None of these gave me anything with clarity.
2. I added "Gibbs" as the method to the 5-topic version, and got slightly better results but still with significant overlap.
3. I upped k to 15 topics with Gibbs method. - Significant overlap.
4. I added an interation of 2000 and burnin of 1000 to the model with 5 topics. Returned results that overlapped enough that it was meaningless.

**Resources I consulted:**
- [ ] Documentation for [package/function]
- [ ] Stack Overflow: [describe what you searched for]
- [ ] Course materials: [which ones]
- [x] Slack discussion
- [x] Office hours
- [x] Other: [Class discussion]

---

**Resolution:**
I still could not get topics that made any sense and were not repeating so much. In class, we discussed that the sample may be too small.

**What I learned:**
Too few years of a journal will really make a difference in the ability to topic model. 

---

### Challenge 2: [Topic Model Numbers]

**What I was trying to do:**
I was trying to figure out how many topics I needed for the Mind and Body corpus issues from 1930-1936.

**What went wrong:**
I am honestly not sure what is going wrong. I think I can't see the forest for the trees, and I'm getting so hung up on the individual words that I'm missing the topic as a whole. I notice that words are frequently repeated in similar positions.

**Did you use AI to troubleshoot this challenge?** [No]

---
---

#### If NO, I didn't use AI:

**Why I chose not to use AI:**
I want to figure out how to understand this myself. I also think this is a conceptual problem, not a technical one.

**My problem-solving process:**
1. I've tried the following k numbers = 10, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25
2. [Second attempt - what you did and what happened]
3. [Additional attempts if relevant]

**Resources I consulted:**
- [ ] Documentation for [package/function]
- [ ] Stack Overflow: [describe what you searched for]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [x] Office hours
- [ ] Other: [describe]

---

**Resolution:**
I ultimately went with 22 topics because I could finally make sense of some of them, but I don't think it's a good output.

**What I learned:**
I learned that I need to practice topic modeling more. 

---

## Reflection

**What I understand well now:**
I understand the point of topic modeling and the technical side of how to do it.

**What I'm still confused about:**
I'm still struggling to figure out the correct number of topics. I know it's supposed to be a "feel" thing but I am not feeling it.

**Connection to historical research:**
I want to use topic modeling, because I can see a lot of usefulness especially with newspapers that I work with, but I have to figure out how to work it more.


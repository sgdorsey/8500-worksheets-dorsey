# Week [X] Learning Log

**Student Name:** Sharon Dorsey  
**Week of:** 2/23-3/2  
**Topic(s):** Basic Data Manipulation

---

## What I Worked On This Week

**Assignment(s):**
- [x] Worksheet [4]
- [ ] Other: [describe]

---

## Challenges & Problem-Solving

### Challenge 1: No City or State with Select

**What I was trying to do:**
The task was to use select() to get all the columns in the gayguides data except for the city and the state. 
**What went wrong:**
I honestly don't know how I missed it, but it was late so I guess I wasn't watching what I was typing closely enough.

**My problem-solving process:**
1. nolocation <- gayguides <- select(-city,-state)
2. nolocation <- gayguides %>% select(-city,-state) - I realized when I pasted the first entry in that I had used <- instead of the pipe %>%
3. [Additional attempts if relevant]

**Resources I consulted:**
- [ ] Documentation for [package/function]
- [ ] Stack Overflow: [describe what you searched for]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [x] Other: [Pasting it outside of the worksheet]

**Resolution:**
Pasting it outside of the worksheet helped me realize that something didn't look right, which helped me realize that nolocation <- gayguides %>% select(-city,-state) was the right code.
**What I learned:**
Sometimes, taking the code outside of the context of the worksheet can be helpful because you can isolate it.

---

### Challenge 2: G/L Amenity Features

**What I was trying to do:**
The task was to find all the entries in the gayguides data that had "(G)" or "(L)" in the amenity features.

**What went wrong:**
[Describe the error, confusion, or roadblock]

**My problem-solving process:**
1. lesbians <- gayguides %>% filter(amenityfeatures == "(G)" | amenityfeatures == "(L)") - I realized this only gave me the titles with only (G) or (L), but didn't deal with the entries that had other amenities as well.
2. grep("(G)", gayguides$amenityfeatures) & grep("(L)", gayguides$amenityfeatures) - "In grep("(G)", gayguides$amenityfeatures) & grep("(L)", gayguides$amenityfeatures) :
  longer object length is not a multiple of shorter object length"
  I tried to break the code apart and see what worked, then consulted documentation.
3. lesbians <- gayguides %>% filter(grepl("(G)", gayguides$amenityfeatures) | grepl("(L)", gayguides$amenityfeatures)) - Worked!

**Resources I consulted:**
- [x] Documentation for [grep]
- [ ] Stack Overflow: [describe what you searched for]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [x] Other: [Google - "how to search through a comma separated list in r" and realized I needed to use grepl]

**Resolution:**
Switching to grepl worked.


**What I learned:**
I got the syntax right, but I needed to refresh myself on grepl.

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



# Week [9] Learning Log

**Student Name:** [Sharon Dorsey]  
**Week of:** [4/27/26]  
**Topic(s):** [e.g., "Mapping"]

---

## What I Worked On This Week

**Assignment(s):**
- [ ] Worksheet [9]
- [ ] Other: [describe]

**AI tools used this week:**
- [ ] ChatGPT
- [x] Claude
- [ ] GitHub Copilot
- [ ] Other: [specify]
- [ ] Did not use AI this week

---

## Challenges & Problem-Solving

### Challenge 1: Loading the data

**What I was trying to do:**
I felt so dumb with this. I was trying to load the Underground Railroad data.

**What went wrong:**
Everytime I loaded it, it would give me an error that said there was no file under that name.

**Did you use AI to troubleshoot this challenge?** [Yes]

---

#### If YES, I used AI:

**My prompt to AI:**
```
It says undergroundRR is not found when I run line 40, but that is the code for the dataset. What is wrong?
```

**AI's response:**
```r
The issue is case sensitivity. Line 40 loads "undergroundRR" (lowercase u), but the dataset in the DigitalMethodsData package is named UndergroundRR (capital U). The variable name used on lines 41 and 43 also uses undergroundRR.

Fix: change the data() call to use the correct capitalization, and update the references:
```

**How I evaluated the AI's suggestion:**

**What I implemented and why:**
I changed the case on underground. In my defense, I really did think I had already tried that, but maybe not with quotation marks?

N/A

**Additional resources I consulted:**
- [x] Documentation for [DigitalMethodsData, UndergroundRR]
- [ ] Stack Overflow: [describe]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [x] Other: [I googled how to load a data set multiple times.]


echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
---



**Resolution:**
Changing the case worked.
**What I learned:**
In all honestly, I still could've sworn that I typed it in correctly multiple times. I do not know what was going on here.
**Verification:**
I tested it, viewed it, and saw it was correct.

---

### Challenge 2: [Map of the US]

**What I was trying to do:**
I was trying to load a map that had Hawaii and Alaska for the parks data.

**What went wrong:**
[I can't get a map with Hawaii and Alaska to load in R and actually render.]

**Did you use AI to troubleshoot this challenge?** [Yes / No]
No

#### If NO, I didn't use AI:

**Why I chose not to use AI:**
I wanted to solve this myself. 

**My problem-solving process:**
1. I loaded the usmaps packages because the documentation said there was a map with Hawaii and Alaska. I tried to update the regions in the original code to include usmaps (which I saved as a variable) - it didn't work, gave me a bunch of errors about stat_sf() requires the following missing aesthetics: geometry
2. I googled this, tried the same code in a couple different places and I still can't get it to work. I get the same error.
3. [Additional attempts if relevant]

**Resources I consulted:**
- [ ] Documentation for [maps, us_maps]
- [x] Stack Overflow: [stat_sf() requires the following missing aesthetics: geometry error when using usmaps package]
- [ ] Course materials: [which ones]
- [ ] Slack discussion
- [ ] Office hours
- [x] Other: [google - I googled this a lot.]

---

**Resolution:**
I still can't get this to work. It's fine if I use the regular maps package, but I can't get it to work with usmaps. I think there might be an issue with the regions it has, but I don't think I really know the documentation well enough, even as I'm reading it, to actually use the package correctly. I'm going to ask about it.

**What I learned:**
I did learn that the original maps package doesn't include Hawaii or Alaska in the usa region (or I might have excluded them earlier and missed that in the worksheet).

---

## Reflection

**What I understand well now:**
I'm really excited about the mapping. I'm getting the hang of it, and I was able to use it (I was really thrilled about that Anderson county churches map I made last week - I have not shut up about it to anyone who will listen at my house.)

**What I'm still confused about:**
I'm still having issues with the Hawaii and Alaska map. There's a disconnect with me and understanding that package somewhere, but I'm going to figure it out.

**How AI affected my learning this week:**
It did fix my case problem with the underground Railroad, so that was helpful.

**Evolving AI strategy:**
Generally, if I give it a specific line to look at, it works better.

**Connection to historical research:**
I will be using mapping a lot. My Anderson county churches map for Dr. Burd's class highlighted that the Methodist churches in mill villages have had the greatest success rate in staying open, which has raised historical questions for me as to what the denomination level has done to make that so. 


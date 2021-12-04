# CSE-111(Databases)
This repository contains all the labs/files I utilized throughout my time in CSE 111, or Databases, at the University of California, Merced. We worked heavily with SQLite. I came into this class without working on SQL before, although I caught on quick. By about lab 4 I could tell I was getting the hang of it and the queries came a lot easier to me. Notes to this class can be found digitally on my Notion, on a request basis. This repository may not be utilized down the line without proper credit to the author (**David Dominguez** for SQL queries usually found in 'test' folder, **Florin Ruso** for anything else) whether that be specific lines of code or ideas.

## Lab 1 
- Building tables

## Lab 2 
- Populating tables

## Lab 3 
- If I navigate to a certain element on a table, I can access anything within that tuple

## Lab 4
- If you need to group multiple columns, the correct syntax is GROUP BY column_1, column_2

## Quiz 2 
- The trees are cool. Definitely a breeze once you figure out what the SQL equivalent statements are. 
- I was stuck on #3 for a long time. Thanks to Jackie for helping me with that one, I was able to intersect the makers correctly, I just didn't join the models with one another to gain that correlation. Good to know for next time though. 

## Lab 5
- I found that if you include tables that serve no purpose in the query, then your query may run EXTRAORDINARILY SLOW. Wow what a difference after I went through and optimized some of the queries.
- Note from problem 9: group by and order by are so confusing to work with together, but this problem _sorta_ makes sense. 
- Note from problem 7: collaboration with Salvador Rodriguez, who helped me solve why I was getting an unnecessary amount in the count. Turns out if you include unnecessary tables in the FROM clause you might have different results. See the problem for more info.
- Note from problem 5: collaboration with Salvador Rodriguez, we both realized our outputs are the same, however we were failing the test case, because lines 3 & 4 are swapped in the result file the test file is checking with. Will include this in comments for submission to get 12/15

## Lab 6
- Okay definitely did not have enough time to do this, wasn't time inefficiency just unfortunate turn of events for the week
- Although, did play a lot with subqueries in the GROUP BY - HAVING clause, along with in the SELECT clause as well. 
- Will go to TA for the following lab to see if I can further improve this lab past the due date and do better for next lab.

## Midterm 1
- I thought it was a very fair midterm. No complaints overall, other than just having the midterm on a Friday in general is rough since I try to get stuff done Friday (groceries, errands, etc. as opposed to Saturday/Sunday when there's lines and traffic). I sped through it and felt pretty happy about my progress. I will not be posting the midterm solutions since that is especially protected and would rather not be sharing it publicly.

## Lab 7 
- I've actually LOVED this lab. I haven't finished it yet but I'm still doing more. I also don't want to take too much time doing it, but it might just be done anyway. Learned up how to use f-string over str.format() since str.format() was actually slowing down my loading speeds. 
- Q3 was TONS of fun to play with. I kept wondering why my query wasn't working, and finally found that the default read() in python grabs EVERYTHING. I only needed the first line. So after more research I was like yeah, let's do a readline(). THIS APPENDS A "\n" AFTER. So finally I found that I could specify the size of the readline() so that I could specify only 5 letters, thus, JAPAN was finally read correctly.
- Welp, just figured out I could've just line.rstrip() instead. Nice. Gave it my best shot, although granted just a small unfamiliarity with Python slowed me down, but all good. Learned it, now we move on to the next.

## Lab 8 
- Pretty standard, most of my debugging was just making sure I had all the correct indices via a PRAGMA index_list(table_name)    

## Lab 9
- Not terrible. Took me a minute to recall that views are just tables, so these questions just wanted us to expand our tables mostly and execute views based on what the values were in the view instead of the tables. 
- For future reference, probably best to keep a piece of paper or something on the side to remember _what_ views corresponded with which tables. You'll see various notes in test.sql where I tried to do this but it was still hard to remember.

## Lab 10 
- Lots of weird debugging like _distinct p_partkey_ would not give me the proper count. I feel like although this assignment was focused on triggers, all the issues I got were with the other statements.

## Quiz 5
- Had to sit down and really use my head for this one, but luckily I understood the mentioned constraint concepts pretty well.   

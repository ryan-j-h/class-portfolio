# STA 323 / 523 :: Homework 3

## Introduction

![](images/fuel_war.jpg)

"To some, the roadside gas station, also known as a convenience store, is a 
necessary evil as part of an enjoyable road trip. But for some people in the 
northeastern U.S., a convenience store is more than a stop, it’s a destination.

"Sheetz started in Western Pennsylvania, Wawa on the eastern side of the state. 
Decades later, each has grown to be a full service, one-stop shop. 
Like two squirrels fighting for the last acorn before the winter snows, the 
friendly rivalry between Sheetz and Wawa lovers has seeped deep into the culture
of the region. It’s the kind of thing you ask on the first date. Parents hope 
to pass their own affiliation down to their children. Team Sheetz or Team Wawa? 
But if you ask the people in the area, you can’t have it both ways."

-[https://www.sheetzvswawa.com](https://www.sheetzvswawa.com)

The above is probably a little hyperbolic, but let's examine this fuel turf 
war by getting the data via scraping, APIs, and then doing some visual analysis.

Before you begin Homework 3, watch 
[Getting Started on Homework 3](https://warpwire.duke.edu/w/pdIDAA/).


## Links to Data

Wawa: Think of this as an API that will fetch JSON data for you with regards to 
a specific store. There is only one field - awawstore. The possible values are 
described in the README. The URL structure is defined as 
http://www2.stat.duke.edu/~sms185/data/fuel/bystore/awaw/awawstore=[store_number].json , 
where you will need to provide the store number. For example, http://www2.stat.duke.edu/~sms185/data/fuel/bystore/awaw/awawstore=08044.json 
contains a valid store number and fetches the data in JSON format. However, http://www2.stat.duke.edu/~sms185/data/fuel/bystore/awaw/awawstore=08000.json 
contains an invalid store number and a 404 error is the response.

Sheetz: Getting the Sheetz data has more of a web scraping flavor. All the data is 
available at http://www2.stat.duke.edu/~sms185/data/fuel/bystore/zteehs/regions.html

## R project organization

#### Directories, scripts, and Rmarkdown

Create directories `data/sheetz/` and `data/wawa/`. These folders will
contain the data you scrape.

You should create the following R script files and put them in a 
directory named `R/`:

- `get_wawa.R`: this script should fetch all the Wawa data at the available 
  links. The resulting data should be saved in `data/wawa/`.
  
- `parse_wawa.R`: this script should read in the saved Wawa data and construct 
  an appropriate data frame or other list object you will be able to use in 
  task 3. It should output a file named `wawa.rds` that will live in 
  `data/wawa/`.
  
- `get_sheetz.R`: this script should function similar to `get_wawa.R` but
  for the Sheetz data.
  
- `parse_sheetz.R`: this script should function similar to `parse_wawa.R` but
  for the Sheetz data.

The main file, `hw3.Rmd`, should contain your documentation and explanations 
for all tasks. In addition, it should have code to read in the `.rds` files; 
task 3 will also be implemented in this file. I should be able to set the chunk 
option `echo = FALSE` and easily understand everything you did without reading
the code.

#### make

Create a `Makefile` that connects all of the project's prerequisites with the 
final target goal being `hw3.html`. Your `Makefile` should be set up such that 
if there are no data files, `make` will execute the recipes to run the necessary
scripts for the data to be scraped and parsed, and have `hw3.html` generated.
Include phony targets `clean_data` and `clean_html` that have recipes that will
remove the `data/` directory and `hw3.html`, respectively. <b>Graduate student
groups should use built-in variables and pattern rules where applicable.</b>

## Tasks

#### Task 1

**Scrape and parse Wawa**

Scrape the Wawa data using the provided base URL (see Slack channel). Stores 
are indexed by a 5 digit value from (possibly) 00000 up to (possibly) 01000 and 
from (possibly) 08000 up to (possibly) 09000. There are not 2002
stores, only a few hundred. Save this data in `data/wawa/`. <i>You may save
the data on a store-by-store basis or aggregate all the stores.</i>

Space out your requests when downloading the data. However, `make` must be
able to build your `hw3.html` file in under 1 hour.

Once you have locally cached all the Wawa data, parse the data to get it in
an appropriate form for task 3. You only need to keep what you will use in 
Task 3. This may be a list or data frame. Save this object in `data/wawa/`.

Include a detailed write-up of your scraping procedure.

#### Task 2

**Scrape and parse Sheetz**

Scrape the Sheetz data using the provided URL (see Slack channel). You will need
to navigate through the website to obtain all the data -  do not hard code the
URLs. Save the data in `data/sheetz/`. <i>You may save
the data on a store-by-store basis or aggregate all the stores.</i>

Space out your requests when downloading the data. This task will be 
much quicker than getting the Wawa data. Keep in mind that `make` must be
able to build your `hw3.html` file in under 1 hour.

Once you have locally cached all the Sheetz data, parse the data to get it in
an appropriate form for task 3. This may be a list or data frame. Save this
object in `data/sheetz/`

Include a detailed write-up of your scraping procedure.

#### Task 3

**Analysis**

Where does the fuel turf war converge? Are there any rival fuel stations inside
each station's "region" or are these two areas completely separable?

Use the `sf` package and location data to create a spatial visualization to
answer the above questions. You may consider those stores only located in
Pennsylvania.

Include a detailed write-up of your procedures and answers to the questions.

#### Task 4

Tidy up or decorate your Rmd file. Incorporate some of the features I used in
labs this semester. Feel free to expand beyond these features. Check out Holtz's 
[Pimp my RMD](https://holtzy.github.io/Pimp-my-rmd/) website.

## Essential details

#### Deadline and submission

<b>The deadline to submit Homework 3 is 11:59am ET on Thursday, June 11.</b>
Only your final commit and code in the master branch will be graded. 
To get your work into branch master (the only branch that will be graded), 
initiate a pull request on GitHub. This will then merge your work into the 
master branch upon approval by you or one of your teammates.

#### Help

- Post your questions in the #hw3 channel on Slack. Explain your error / problem
  in as much detail as possible or give a reproducible example that generates 
  the same error. Make use of the code snippet option available in Slack.

- Visit the instructor or TAs in Zoom office hours.

- The instructor and TAs will not answer any questions within 6 hours of the
  deadline.

#### Academic integrity

This is a team assignment. You should not communicate with other
teams. As a reminder, any code you use directly or as inspiration must be cited.

*Undergraduate:*

To uphold the Duke Community Standard:

- I will not lie, cheat, or steal in my academic endeavors;
- I will conduct myself honorably in all my endeavors; and
- I will act if the Standard is compromised.

*Graduate:*

Duke University is a community dedicated to scholarship, leadership, and 
service and to the principles of honesty, fairness, respect, and accountability.
Citizens of this community commit to reflect upon and uphold these principles in
all academic and non-academic endeavors, and to protect and promote a culture of
integrity. Cheating on exams and quizzes, plagiarism on homework assignments and
projects, lying about an illness or absence and other forms of academic 
dishonesty are a breach of trust with classmates and faculty, violate the Duke
Community Standard, and will not be tolerated. Such incidences will result in a 
0 grade for all parties involved as well as being reported to the University
Judicial Board. Additionally, there may be penalties to your final class grade.
Please review Duke’s Standards of Conduct.

#### Grading

| **Topic**                           | **Points** |
|-------------------------------------|-----------:|
| Task 1                              |          8 |
| Task 2                              |          6 |
| Task 3                              |          8 |
| Task 4                              |          2 |
| Project organization and `Makefile` |          6 |
| **Total**                           |     **30** |

*Documents that fail to knit after minimal intervention will receive a 0*.

## References

1. 2018, Y. (2020). Pimp my RMD: a few tips for R Markdown. Holtzy.github.io. 
   Retrieved 4 June 2020, from https://holtzy.github.io/Pimp-my-rmd/

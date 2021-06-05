# Pewlett-Hackard-Analysis

## Overview 
The purpose of this analysis is to help identify the number of retiring employees this year from Pewlett Hackard's vast employee database, as well as identify other employees that are eligible to participate in a mentorship program. Using PostgreSQL, we are able to create queries that can select all of the upcoming retirees from the database quickly and efficiently. Judging from the results, there appears to be a "silver tsunami" of employees planning to retire. 
## Results 
The results of the Pewlett Hackard analysis are as follows: 
* At a high level, 90K+ employees at Pewlett Hackard are ready to retire this year. We can see the count of retirees by title [here](https://github.com/matthewprice-github/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.csv). 
* 29.4K (or 33%) of the retirees are senior engineers, which is the most common title of the outgoing employees, followed closely by 28.3K (or 31%) Senior Staff, and 14.2K (or 16%) Engineers. 
* The title least affected by the next wave of retirees are managers, where only 2 are planning to retire this year. 
* Looking at the [mentorship eligablity list](https://github.com/matthewprice-github/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibility.csv), there appear to be only ~1.5K employees that are eligable for the membership program

## Summary 
The analysis begs the answer of two questions: 
*How many roles will need to be filled as the "silver tsunami" begins to make an impact?*
As outlined in the results section, >90K roles will need to be filled as the "silver tsunami" descends on Poewlett Hackard. For senior leadership, there could be ways to consolidate or downsize certain teams as a way of offsetting the sheer volume of roles needed to be replaced. 
*Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?*
Considering that only ~1.5K of current employees are eligable for mentorship program, the answer is likely no. It will be hard for those 1.5K employees to fill the gap left by over 90K retirees. 

There are a couple of queires that could provide a little more insight into the silver tsunami. The question I believe would be most pressing is which titles at Pewlett Hackard have the highest percentage of employees planning to retire? We know that Senior Engineer has the most roles planning to retire by volume, and managers the least, but how many employees have those titles? 

A query you could make to find the title counts for all current employees is this: 

```
SELECT COUNT (DISTINCT (emp_no)), title
FROM titles
WHERE to_date = '9999-01-01'
GROUP BY title
```


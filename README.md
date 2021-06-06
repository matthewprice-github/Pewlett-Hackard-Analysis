# Pewlett-Hackard-Analysis

## Overview 
The purpose of this analysis is to help identify the number of employees reaching retirement age at Pewlett Hackard using their vast employee database, as well as identify other employees that are eligible to participate in a mentorship program. Using PostgreSQL, we are able to create queries that can select all of the upcoming retirees from the database quickly and efficiently. Judging from the results, there appears to be a "silver tsunami" of employees planning to retire. 
## Results 
The results of the Pewlett Hackard analysis are as follows: 
* At a high level, looking at the [count of retiring employees by title](https://github.com/matthewprice-github/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv), 90K+ employees at Pewlett Hackard are ready to retire this year.
* The title most affected by the "silver tsunami" are senior engineers, with 29.4K (or 33%) of roles retirement eligable, followed closely by 28.3K (or 31%) of Senior Staff, and 14.2K (or 16%) of Engineer roles. 
* The title least affected by the next wave of retirees are managers, where only 2 are planning to retire this year. 
* Looking at the [mentorship eligablity list](https://github.com/matthewprice-github/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibility.csv), there appear to be only ~1.5K employees that are eligable for the membership program

## Summary 
The analysis brings about two very importat questions:  

*How many roles will need to be filled as the "silver tsunami" begins to make an impact?*

As outlined in the results section, >90K roles will need to be filled as the "silver tsunami" descends on Poewlett Hackard. For senior leadership, there could be ways to consolidate or downsize certain teams as a way of offsetting the sheer volume of roles needed to be replaced. 

*Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?*

Considering that only ~1.5K of current employees are eligable for mentorship program, the answer is likely no. It will be hard for those 1.5K employees to fill the gap left by over 90K retirees. 

There are a couple of queires that could provide a little more insight into the silver tsunami. The question I believe would be most pressing is which titles at Pewlett Hackard have the highest percentage of employees planning to retire? We know that Senior Engineer has the most roles planning to retire by volume, and managers the least, but how many employees have those titles? To find out, a query can be made using data from the [titles](https://github.com/matthewprice-github/Pewlett-Hackard-Analysis/blob/main/Data/titles.csv) table: 

```
SELECT COUNT (DISTINCT (emp_no)), title
FROM titles
WHERE to_date = '9999-01-01'
GROUP BY title
```
Running that query, you can see that there are 85.9K Senior Engineer's currently employeed in the entire company, and 29.4K (~34%) are planning to retire, which is pretty significant. But looking at all the title counts will indicate that 49% of assistant engineer roles, 48% of staff roles, and 46% of engineer roles are at retirement age! While those titles are not the most affected by volume, they are the most affected on a per capita basis. 

Another aspect of the silver tsunami thats worth diving into is what departments have the largest number of retirees, we can achieve that by utlizing INNER JOIN and GROUP BY to group all of the retired titles (from [unique titles](https://github.com/matthewprice-github/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles.csv) table) by department (from [dept_emp](https://github.com/matthewprice-github/Pewlett-Hackard-Analysis/blob/main/Data/dept_emp.csv) and [departments](https://github.com/matthewprice-github/Pewlett-Hackard-Analysis/blob/main/Data/departments) tables). 
``` 
SELECT COUNT(u.emp_no), de.dept_no, d.dept_name
FROM unique_titles as u 
INNER JOIN dept_emp as de
ON (u.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
GROUP BY de.dept_no, d.dept_name
```

After running that query, you can see the departments hardest hit by the silver tsunami are Development (25.6K retirees) and Production (22.2K retirees).  





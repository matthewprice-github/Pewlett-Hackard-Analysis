-- Origial query 
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e 
INNER JOIN titles AS t 
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO retirment_unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Count number of retirees by title 
SELECT COUNT(title), title 
INTO unique_titles_count
FROM retirment_unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC

-- Select all employees born in 1965 who are still working at Pewlett Hackard
SELECT DISTINCT ON (e.emp_no) 
e.emp_no,
e.first_name, 
e.last_name, 
e.birth_date, 
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees as e 
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no

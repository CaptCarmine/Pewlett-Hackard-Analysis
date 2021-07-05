--Delieverable 1 SQL Queries
--Join to create retirement_titles_file
SELECT  e.emp_no, 
		e.first_name, 
		e.last_name, 
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, title DESC  

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
					first_name,
					last_name,
					title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Use Count with Orderby to count number of retiring employees by title
SELECT COUNT (emp_no),
			title	
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

--Deliverable 2 Item

SELECT DISTINCT ON (e.emp_no) e.emp_no,
		e.first_name, 
		e.last_name,
		e.birth_date,
		dep.from_date,
		dep.to_date,
		t.title
INTO mentorship_eligibilty
FROM employees as e
LEFT JOIN dept_emp as dep
ON e.emp_no = dep.emp_no
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (dep.to_date='9999-01-01')
ORDER BY e.emp_no;
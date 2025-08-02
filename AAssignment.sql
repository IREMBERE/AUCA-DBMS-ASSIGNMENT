--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-08-02 18:40:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 24835)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(100)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24830)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    hire_date date,
    salary numeric(10,2),
    department_id integer,
    gender character varying(10),
    phone character varying(15)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24845)
-- Name: employee_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_projects (
    employee_id integer NOT NULL,
    project_id integer NOT NULL,
    assigned_date date
);


ALTER TABLE public.employee_projects OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24840)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    project_name character varying(100),
    start_date date,
    end_date date
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 4907 (class 0 OID 24835)
-- Dependencies: 218
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name) FROM stdin;
1	Human Resources
2	Finance
3	Information Technology
4	Marketing
5	Legal
6	Operations
7	Customer Service
8	Sales
9	Research and Development
10	Procurement
\.


--
-- TOC entry 4906 (class 0 OID 24830)
-- Dependencies: 217
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, first_name, last_name, email, hire_date, salary, department_id, gender, phone) FROM stdin;
101	Alice	Johnson	alice.johnson@company.com	2015-03-15	4500.00	1	Female	+250781111111
102	Bob	Smith	bob.smith@company.com	2018-06-23	5200.00	3	Male	+250782222222
103	Carol	Adams	carol.adams@company.com	2012-09-10	6700.00	2	Female	+250783333333
104	David	Lee	david.lee@company.com	2020-01-05	3800.00	4	Male	+250784444444
105	Eve	Martins	eve.martins@company.com	2019-12-11	4000.00	3	Female	+250785555555
106	Frank	Green	frank.green@company.com	2017-07-08	6000.00	8	Male	+250786666666
107	Grace	Brown	grace.brown@company.com	2014-11-02	4900.00	5	Female	+250787777777
108	Hank	Wilson	hank.wilson@company.com	2013-02-17	3100.00	6	Male	+250788888888
109	Ivy	Clark	ivy.clark@company.com	2021-08-30	2700.00	9	Female	+250789999999
110	Jake	White	jake.white@company.com	2022-05-19	3600.00	7	Male	+250780000000
\.


--
-- TOC entry 4909 (class 0 OID 24845)
-- Dependencies: 220
-- Data for Name: employee_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_projects (employee_id, project_id, assigned_date) FROM stdin;
101	201	2023-01-10
102	203	2024-01-05
103	202	2022-05-20
104	204	2025-02-10
105	203	2024-01-07
106	207	2022-04-15
107	205	2023-07-15
108	210	2022-09-10
109	208	2025-01-10
110	206	2021-11-05
\.


--
-- TOC entry 4908 (class 0 OID 24840)
-- Dependencies: 219
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, project_name, start_date, end_date) FROM stdin;
201	HR Revamp	2023-01-01	2023-12-31
202	Finance Automation	2022-05-15	2023-04-30
203	IT Infrastructure Upgrade	2024-01-01	\N
204	Marketing Blitz 2025	2025-02-01	2025-06-30
205	Legal Compliance	2023-07-10	2024-01-10
206	Customer Portal	2021-11-01	2022-10-31
207	Sales Booster	2022-04-01	2023-03-31
208	R&D Pilot	2025-01-01	\N
209	Procurement Tracker	2024-03-15	2024-11-15
210	Operations Streamline	2022-09-01	2023-09-01
\.


--
-- TOC entry 4756 (class 2606 OID 24839)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- TOC entry 4754 (class 2606 OID 24834)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 4760 (class 2606 OID 24849)
-- Name: employee_projects employee_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_projects
    ADD CONSTRAINT employee_projects_pkey PRIMARY KEY (employee_id, project_id);


--
-- TOC entry 4758 (class 2606 OID 24844)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


-- Completed on 2025-08-02 18:40:11

--
-- PostgreSQL database dump complete
--
-- EXERCISES/QUESTIONS

--String Function Exercises (15)

--1. Concatenate first and last name as full_name. 
 select first_name || ' ' || last_name as full_name from employee;
--2. Convert all employee names to lowercase. 
select LOWER(first_name) as first_name_lower, LOWER(last_name) as last_name_lower from employee;
--3. Extract first 3 letters of the employee's first name. 
select SUBSTRING(first_name FROM 1 FOR 3) as first_3 from employee;
--4. Replace '@company.com' in email with '@org.com'. 
 select REPLACE(email, '@company.com', '@org.com') as updated_email from employee;
--5. Trim spaces from a padded string. 
 select TRIM(both from '   ' || first_name || '   ') as trimmed_name FROM employee;
--6. Count characters in an employee’s full name. 
 select LENGTH(first_name || ' ' || last_name) as name_length from employee;
--7. Find position of '@' in email using INSTR()/CHARINDEX(). 
 select POSITION('@' IN email) as at_position from employee;
--8. Add ‘Mr.’ or ‘Ms.’ before names based on gender (assume gender exists). 
SELECT 
  CASE 
    WHEN gender = 'M' THEN 'Mr. ' || first_name || ' ' || last_name
    WHEN gender = 'F' THEN 'Ms. ' || first_name || ' ' || last_name
    ELSE first_name || ' ' || last_name
  END AS titled_name
FROM employee;

--9. Format project names to uppercase. 
 select UPPER(project_name) as upper_project_name from projects;
--10. Remove any dashes from project names. 
select REPLACE(project_name, '-', '') as clean_project_name from projects;
--11. Create a label like “Emp: John Doe (HR)”. 
SELECT 'Emp: ' || first_name || ' ' || last_name || ' (' || department_name || ')' AS label
FROM employee e
JOIN departments d ON e.department_id = d.department_id;

--12. Check email length for each employee. 
select email, LENGTH(email) as email_length from employee;
--13. Extract last name only from email (before @). 
select SPLIT_PART(email, '@', 1) as email_name_part from employee;
--14. Format: “LASTNAME, Firstname” using UPPER and CONCAT. 
 select UPPER(last_name) || ', ' || INITCAP(first_name) as formatted_name from employee;
--15. Add “(Active)” next to employee names who have current projects. 
SELECT 
  first_name || ' ' || last_name || 
  CASE 
    WHEN p.end_date IS NULL OR p.end_date > CURRENT_DATE THEN ' (Active)'
    ELSE ''
  END AS name_status
FROM employee e
JOIN employee_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id;

--Numeric Function Exercises (10) 

--16. Round salary to the nearest whole number. 
select first_name, last_name, ROUND(salary) as rounded_salary from employee;
--17. Show only even salaries using MOD. 
 select first_name, last_name, salary  from employee  WHERE MOD(salary::INT, 2) = 0;
--18. Show difference between two project end/start dates using DATEDIFF. 
select AGE(end_date,start_date) AS duration FROM projects;
--19. Show absolute difference in salaries between two employees. 
select ABS(e1.salary - e2.salary) AS salary_difference from employee e1, employee e2 WHERE e1.first_name = 'Alice' AND e2.first_name = 'Bob';
--20. Raise salary by 10% using POWER. 
 SELECT first_name, salary, salary * POWER(1.1, 1) AS raised_salary FROM employee;
--21. Generate a random number for testing IDs. 
 select FLOOR(RANDOM() * 1000 + 1)::INT AS test_id;
--22. Use CEIL and FLOOR on a floating salary.
  select first_name, salary, CEIL(salary), FLOOR(salary) from employee;
--23. Use LENGTH() on phone numbers (assume column exists).
 select first_name, LENGTH(phone) AS phone_length FROM employee;
--24. Categorize salary: High/Medium/Low using CASE.
 select  first_name, salary, CASE  WHEN salary >= 6000 THEN 'High' WHEN salary BETWEEN 4000 AND 5999 THEN 'Medium' ELSE 'Low' END AS salary_category from employee;
--25. Count digits in salary amount.
 SELECT employee_id, salary, LENGTH(REPLACE(salary::TEXT, '.', '')) AS digit_count FROM employee;

--Date/Time Function Exercises (10)

--26. Show today’s date using CURRENT_DATE. 
select current_date as today;
--27. Calculate how many days an employee has worked. 
 select first_name,last_name,current_date-hire_date as days_worked from employee;
--28. Show employees hired in the current year.
 elect * from employee where extract(year from hire_date)=extract(year from current_date);
--29. Display current date and time using NOW(). 
select now() as current_datetime;
--30. Extract the year, month, and day from hire_date. 
select first_name,extract(year from hire_date) as hire_year,extract(month from hire_date)as hire_month,extract(day from hire_date) as hire_day from employee;
--31. Show employees hired before 2020. 
 select * from employee where hire_date<date'202-01-01';
--32. List projects that ended in the last 30 days. 
 select from projects where end_date is not null and end_date >=current_date-interval '30 days';
--33. Calculate total days between project start and end dates. 
select project_name,end_date-start_date as duration_days from projects where end_date is not null;
--34. Format date: ‘2025-07-23’ to ‘July 23, 2025’ (use CONCAT).
 SELECT CONCAT(TO_CHAR(DATE '2025-07-23', 'FMMonth'), ' ', 
              TO_CHAR(DATE '2025-07-23', 'DD'), ', ',
              TO_CHAR(DATE '2025-07-23', 'YYYY')) AS formatted_date;

--35. Add a CASE: if project still active (end_date IS NULL), show ‘Ongoing’. 
select project_name, case when end_date is null then 'ongoing' else 'completed' end as project_status from projects;

--Conditional Function Exercises (15) 

--36. Use CASE to label salaries. 
select first_name,salary, case when salary >=6000 then 'high' when salary >=4000 then 'medium' else 'low' end as salary_label from employee;
--37. Use COALESCE to show ‘No Email’ if email is NULL. 
select first_name, coalesce(email,'no email') as email_status from employee;
--38. CASE: If hire_date < 2015, mark as ‘Veteran’. 
select first_name,hire_date,case when hire_date<date'2015-01-01' then 'veteran' else 'newcomer' end as expirience_level from employee;
--39. If salary is NULL, default it to 3000 using COALESCE. 
select first_name, coalesce(salary,3000) as adjusted_salary from employee;
--40. CASE: Categorize departments (IT, HR, Other). 
SELECT department_name,
  CASE 
    WHEN department_name = 'Information Technology' THEN 'IT'
    WHEN department_name = 'Human Resources' THEN 'HR'
    ELSE 'Other'
  END AS department_category
FROM departments;

--41. CASE: If employee has no project, mark as ‘Unassigned’.
 select e.first_name, case when ep.project_id is null then 'Unassigned' else 'assigned' end as project_status from employee e left join employee_projects ep on e.employee_id=ep.employee_id;
--42. CASE: Show tax band based on salary. 

assignment=# select first_name , salary, case when salary >=6000 then '30%' when salary >=4000 then '20%' else '10%' end as taxt_band from employee;
--43. Use nested CASE to label project duration. 
 select project_name,case when end_date is null then 'ongoing' else case when end_date-start_date > 180 then 'long-term' else 'short-term' end end as duration_type from projects;
--44. Use CASE with MOD to show even/odd salary IDs. 
 select employee_id, case when mod(employee_id,2)=0 then 'even id' else 'odd id' end as id_parity from employee;
--45. Combine COALESCE + CONCAT for fallback names. 
select coalesce(first_name,'nofirst')||' '|| coalesce(last_name,'nolast') as full_name from employee;
--46. CASE with LENGTH(): if name length > 10, label “Long Name”. 
select first_name ||' '|| last_name as full_name,case when length(first_name||last_name)>10 then'long name' else 'short name' end as name_length_type from employee;
--47. CASE + UPPER(): if email has ‘TEST’, mark as dummy account. 
select email, case when upper(email) like '%test%' then 'dummy account' else 'real account' end as email_type from employee;
--48. CASE: Show seniority based on hire year (e.g., Junior/Senior). 
SELECT first_name, hire_date,
  CASE 
    WHEN EXTRACT(YEAR FROM hire_date) <= 2015 THEN 'Senior'
    WHEN EXTRACT(YEAR FROM hire_date) BETWEEN 2016 AND 2020 THEN 'Mid-level'
    ELSE 'Junior'
  END AS seniority
FROM employee;

--49. Use CASE to determine salary increment range. 
 select first_name ,salary, case when salary<3000 then salary * 1.20 when salary<5000 then salary *1.15 else salary * 1.10 end as new_salary from employee;
--50. Use CASE with CURDATE() to determine anniversary month.
select first_name ,hire_date, case when extract(month from hire_date)=extract(month from current_date) then 'anniversary month' else 'not anversary' end as anniversary_status from employee;
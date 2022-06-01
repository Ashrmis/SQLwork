use hr_db;
-- sub-queries 
-- This won't work because it's invalid use of aggregate function
-- 	select * from employees
-- 	where salary > avg(salary);
select * from employees
where salary > (select avg(salary) from employees);
-- Execute a query to retrieve all employees records 
-- whose salary is lower than the average salary.
select F_name,L_name,salary from employees
where salary < (select avg(salary) as avgSalary from employees);

-- Execute a query that retrieves all employees records with
-- EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
select emp_id,salary, 
	   (select max(salary) from employees) as maxSalary 
from employees;

-- Execute a Table Expression for the EMPLOYEES table that excludes
-- columns with sensitive employee data 
-- (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).

select * from 
(select emp_id,f_name,l_name,salary from employees) as emp_nonSensitive
    where salary>60000
    order by salary;



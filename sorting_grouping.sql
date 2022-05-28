-- String patterns and sorting
-- Retrieve all employees whose address is in Elgin,IL.
select F_name,L_name from employees
where address like '%Elgin,IL%';

-- Retrieve all employees who were born during the 1970's.
select F_name,L_name from employees
where b_date like '%/197%';

-- Retrieve all employees in department 5 whose salary is between 60000 and 70000.
select  F_name,L_name from employees
where (dep_id=5) and (salary between 60000 and 70000);

-- Retrieve a list of employees ordered by department ID.
select  F_name,L_name,dep_id from employees
order by dep_id;

-- Retrieve a list of employees ordered in descending order by department ID
-- and within each department ordered alphabetically in descending order by last name.

select  F_name,L_name,dep_id from employees
order by dep_id desc, L_name desc;

select * from employees;

-- Grouping
-- For each department ID retrieve the number of employees in the department.
select dep_id, count(dep_id) as Count from employees
group by dep_id;

-- For each department retrieve the number of employees in the department, 
-- and the average employee salary in the department.
select dep_id, count(dep_id) as Count,
	avg(salary) as avgSalary from employees
	group by dep_id
    order by avgSalary;
    
-- limit the result to departments with fewer than 4 employees.
-- HAVING rather than WHERE since HAVING works with 
select dep_id, count(dep_id) as Count,
	avg(salary) as avgSalary from employees
	group by dep_id
    having Count < 4
    order by avgSalary;





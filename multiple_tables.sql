-- Exercise 1: Accessing Multiple Tables with Sub-Queries
use hr_db;
select * from employees,departments;

select * from employees,departments
where employees.dep_id=departments.dept_id_dep;

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
-- implicit join
select * from employees E, jobs J
where J.job_ident=E.job_id;

-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
select * from employees
where job_id in
(select job_ident from jobs where job_title="Jr. Designer");

-- Retrieve JOB information and who earn more than $70,000.
select * from jobs
where job_ident in
(select job_id from employees where salary>70000);

-- Retrieve JOB information and whose birth year is after 1976.
select * from jobs
where job_ident in
(select job_id from employees where YEAR(b_date) > 1976 );

-- Retrieve JOB information for female employees whose birth year is after 1976.
select * from jobs
where job_ident in
(select job_id from employees where YEAR(b_date) > 1976 and sex="F" );

-- Exercise 2: Accessing Multiple Tables with Implicit Joins
-- Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
select * from employees,jobs;

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from employees E, jobs J
where J.job_ident=E.job_id;

-- Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
select emp_id,F_name,L_name,job_title from employees E, jobs J
where J.job_ident=E.job_id;

-- Redo the previous query, but specify the fully qualified column 
-- names with aliases in the SELECT clause.
select E.emp_id,E.F_name,E.L_name,J.job_title from employees E, jobs J
where J.job_ident=E.job_id;








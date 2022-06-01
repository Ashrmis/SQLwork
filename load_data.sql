use hr_db;

-- didn't work, error code 1290. Will use data import tool.
LOAD DATA LOCAL INFILE  
'c:/Ashish/Downloads/Employees.csv'
INTO TABLE employees

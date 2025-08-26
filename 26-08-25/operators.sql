use sathyabama;
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME VARCHAR(25),
    LAST_NAME VARCHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(25)
);

INSERT INTO Worker 
    (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');
    
#AND operator
select * from Worker where DEPARTMENT = 'Admin' and SALARY >200000;      
select * from Worker where DEPARTMENT = 'Admin' and FIRST_NAME = 'Vivek';

#OR operator
select * from Worker where DEPARTMENT = 'Account' or SALARY >200000;
select * from Worker where WORKER_ID > 2 and SALARY >200000;

#NOT operator
select * from Worker where  NOT DEPARTMENT = 'Account';
select * from Worker where NOT FIRST_NAME = 'Geetika';

#Monthly Salary
select SALARY/12 as Monthly_Salary FROM Worker;

#10% Incremented salary display
select (SALARY*0.1 + SALARY) as Incremented_Salary FROM Worker;

#First Name Exactly 5 characters 
select * from Worker where FIRST_NAME like '_____';

#IN 
select * from Worker where  WORKER_ID in (1,3,5,7) and SALARY > 100000;
select * from Worker where  DEPARTMENT in ('Admin','Account') and SALARY > 10000;

#NOT IN 
select * from Worker where  WORKER_ID NOT in (1,3,5,7) and SALARY > 100000;
select * from Worker where  DEPARTMENT NOT  in ('Admin','Account') and SALARY > 10000;

#Between
select * from Worker where SALARY between 100000 and 200000;
select * from Worker where WORKER_ID between 3 and 10;

# Not Between 
select * from Worker where SALARY not between 50000 and 75000;
select * from Worker where WORKER_ID not between 4 and 8;

#1. Find workers not in HR or Admin with salary between 70000 and 300000.
select * from Worker where DEPARTMENT not in ('hr','Admin') and SALARY between 70000 and 300000;

#2. Find workers with first name starting with 'V' and salary greater than or equal to 200000.
select * from Worker where FIRST_NAME like 'v%' and SALARY >= 200000;

#3. Find workers not in Admin with salary < 100000.
select * from Worker where DEPARTMENT not in ('Admin') and SALARY < 100000;

#AGGREGATION FUNCTIONS 

#1. MIN
select min(SALARY) AS lowest_salary from Worker;

#2. MAX
select max(SALARY) AS highest_salary from Worker;

#3. COUNT
select count(WORKER_ID) AS Total_Workers from Worker;

#4. SUM
select sum(SALARY) AS total_salary from Worker ; 

# 5. AVERAGE
select DEPARTMENT , avg(SALARY) AS avg_salary from Worker WHERE DEPARTMENT = 'HR' GROUP BY DEPARTMENT;

#1. Find the average salary in the Admin department.
SELECT AVG(SALARY) FROM Worker WHERE DEPARTMENT = 'Admin';

#2. Total salary for HR and Admin departments combined.
SELECT SUM(SALARY) AS TOTAL_SALARY from Worker where DEPARTMENT IN ('HR','Admin');

#3. Count employees whose first name starts with 'V'.
select count(WORKER_ID) AS TOTAL FROM Worker WHERE FIRST_NAME like 'v%';

#4.Total salary of employees with salary between 50000 and 200000
SELECT SUM(SALARY) AS TOTAL FROM Worker WHERE SALARY BETWEEN 50000 AND 200000;

# UNION
select FIRST_NAME FROM Worker UNION select SALARY FROM Worker;

#UNION ALL
select DEPARTMENT FROM Worker UNION ALL select SALARY FROM Worker;

#CASE 
SELECT FIRST_NAME , SALARY , DEPARTMENT ,
CASE
    WHEN SALARY >=300000 THEN 'RICH'
    WHEN SALARY >=100000 AND SALARY <300000 THEN 'MIDDLE CLASS'
    ELSE 'POOR'
END AS STATUS_OF_SALARY FROM Worker;    



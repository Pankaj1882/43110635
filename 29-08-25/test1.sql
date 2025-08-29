create database text;
use text;
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');      
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 select * from Worker;
 select * from Bonus;
 select * from Title;
 
 # 1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 select FIRST_NAME as WORKER_NAME from Worker;

#2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(FIRST_NAME) from Worker;

#3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select department from worker union select department from worker ;

#4. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side
select rtrim(FIRST_NAME) as removed_white_spaces from Worker;

#5. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from Worker order by FIRST_NAME ASC;

#6. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Worker order by FIRST_NAME;
 
#7. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from Worker where first_name in('Vipul' ,'satish');

#8. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from Worker where first_name like 'a%';

#9. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from Worker where first_name like '%a';

#10. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from Worker where first_name like '%h' and first_name like '______';

#11. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from Worker where salary between 100000 and 500000;

#12. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select DEPARTMENT , count(worker_id) as total_employees_in_admin from Worker where DEPARTMENT = 'Admin' group by DEPARTMENT;

#13. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department , count(worker_id) as total_employees from Worker group by department order by count(worker_id) ;

#14. Write an SQL query to print details of the Workers who are also Managers. (High Level)
select * from Worker join title where department = 'Managers';

#15. Write an SQL query to show only odd rows from a table.
select * from worker where (worker_id % 2 != 0);

#16. Write an SQL query to show the top 4 records of a table.
select * from worker limit 4;

#17. Write an SQL query to fetch the list of employees with the same salary. (High Level)
select salary , count(worker_id)  from worker where salary =  (select max(salary) from worker) group by salary ;

#18. Write an SQL query to show the second highest salary from a table.
select first_name , max(salary) from worker group by first_name limit 1 offset 2 ;

#19. Write an SQL query to show one row twice in results from a worker table.
select * from worker union all select * from worker;


#20. Write an SQL query to fetch the first 50% records from a table. (without using limit and offset)
select * from worker
 where worker_id<=(select count(*)/2 from worker);

#21. Write an SQL query to fetch the departments that have less than five people in it.
SELECT department, count(*) AS total_employees from Worker GROUP BY department having COUNT(*) < 5;


#22. Write an SQL query to show all departments along with the number of people in there.
select department , count(worker_id) as total_employees from worker group by department;

#23. Write an SQL query to show the last record from a table.
SELECT * FROM Worker ORDER BY worker_id DESC
LIMIT 1;


#24. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name , salary from worker where salary = (select max(salary) from worker);

#25. Write an SQL query to print the name of employees having the highest salary in each department.


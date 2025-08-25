use sathyabama;
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
        
#show as what client can understand (alias)
select worker_id as Employee_no  from worker;

#like operator
select * from worker where last_name like 'a%' ;# when you know only first letter of your employee
select * from worker where first_name like '%h';# when you know only last letter of your employee
select * from worker where last_name like '_e%';# when you know only second letter of your employee
select * from worker where last_name like '%a_' ;#when you know only last second letter of your employee


#view
create view highest_salary as 
select worker_id as employe_no,salary,department from worker
where salary > 100000;
select * from highest_salary;#shows who have more than 1l salary

#updating view
create or replace view highest_salary as 
select worker_id,salary,department from worker
where salary > 100000 && department = 'admin';
select * from highest_salary;#shows who have more than 1l salary in admin dept

drop view highest_salary;#view condition is dropped

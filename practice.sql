use sathyabama;
create table form(
emp_id int not null unique, emp_name varchar(100), emp_age int not null,
emp_salary int not null);
desc form;
insert into form values
(101,'motu',21,80000),
(102,'pathlu',22,40000),
(103,'pankaj',20,100000);
select * from form;
alter table form
modify emp_name varchar(100) not null;
update form
set emp_salary = 85000
where emp_id = 102;

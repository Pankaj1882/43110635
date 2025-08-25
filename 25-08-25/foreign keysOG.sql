create database college_links;
use College_links;

#Creating College
create table college
(Clg_id int primary key,Clg_Name varchar(40) not null,Clg_Affliation varchar(30) not null);
insert into college values
(101,'Sathyabama','Deemed University'),
(201,'AGNI College','Affliated to Anna Vniversity'),
(301,'VIT','Deemed University');

#creatin departments
create table departments

(Dept_id int primary key,Dept_Name varchar(50) not null,Clg_id int,
foreign key (Clg_id) references college(Clg_id)
on update cascade
on delete cascade);
insert into departments values
(11,'CSE',101),
(12,'ECE',101), 
(13,'EEE',101),
(21,'CSE',201), 
(22,'ECE',201), 
(23,'EEE',201), 
(31,'CSE',301), 
(32,'ECE',301), 
(33,'EEE',301);

create table students
(Stu_id int primary key,Stu_Name varchar(50) not null,Dept_id int not null,
foreign key (dept_id) references departments(Dept_id)
on update cascade
on delete cascade);
insert into students values
(43110612,'Nijanthan',11),
(43110635,'Pankaj',11),
(43110622,'Kumar',12),
(43110655,'Nithesh',12),
(43110615,'acelin',13),
(43110634,'santhosh',13),
(43110616,'rajesh',21),
(43110624,'jaswin',21),
(43110686,'agilan',22),
(43110653,'prabhu',22),
(43110646,'balu',23),
(43110633,'madhan',23),
(43110676,'rakesh',31),
(43110687,'datchana',31),
(43110647,'bharat',32),
(43110689,'prasanth',32),
(43110699,'thomas',33),
(43110639,'kalai',33);
select * from departments where dept_id = 11;

#updating the college id
update college
set Clg_id = 555
where Clg_id = 101;

#after updating
select * from departments where clg_id = 555;
select * from college;# suuccessfully updated

#deleting the whole college
delete from college
where clg_id = 301;

#check whether any deleted college students are there in the table
select * from students
where students_id = 43110639;#error because the clg is deleted


select * from departments;#also the departments from the college is deleted

#connecting all three tables using join
select s.Stu_id,s.Stu_name,d.dept_name,c.Clg_name
from students s
join departments d
on s.dept_id = d.dept_id
join college c
on d.clg_id = c.clg_id;


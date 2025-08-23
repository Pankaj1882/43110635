use sathyabama;
create table pract (name varchar(50),age int,role varchar(30),state varchar(40));
insert into pract values
('Nijanthan',20,'Designer','TamilNadu'),
('bharath',21,'Developer','TamilNadu'),
('Pankaj',22,'Tester','Bihar');


alter table pract
add country varchar(10) default 'India';


select*from pract;


update pract
set country = 'mumbai'
where name = 'pankaj';


select * from pract;


insert into pract values
('Rohan',19,'Analyst','karnataka','India');


update pract
set age = age+1;


alter table pract
rename column country to nationality;


update pract
set role = 'data scientist',age = 20
where name = 'bharath';


delete from pract
where name = 'Rohan';


select name from pract
where state = 'tamilnadu';

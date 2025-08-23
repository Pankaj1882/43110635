use sathyabama;
create table prac(Name varchar(45),age int);
insert into prac3 values
('pankaj',19),('Sowmiya',20);
commit;
start transaction;
select*from prac3;
update prac3
set age = 22
where name = 'Sowmiya';
savepoint a;
insert into prac values
('preethi',25);
savepoint b;
rollback to a;
select*from prac;
insert into prac values
('Dhamu',22);
savepoint c;
rollback to b;
select*from prac3;
 
 
 
 



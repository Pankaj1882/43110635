# FOREIGN KEY CONCEPT
create database amazon;
use amazon;
create table cate(
cid int primary key , cname varchar(50) not null );

alter table cate
add column cdescription varchar(100);

insert into cate values 
(101, 'electonics','no description') , (102,'fashion','no description') , (103,'utensils','no description');
select * from cate;

create table prod(
pid int primary key , pname varchar(30) not null, pdescription varchar(100) not null);

drop table prod;

create table pro(
pid int primary key , pname varchar(30) not null, pdescription varchar(100) not null , cid int,
foreign key (cid) references cate(cid));   # connection of tables through foreign key syntax

insert into pro values
(1,'i17','no description',101) , (2,'s28','no description',101) ,
(3,'pant','no description',102) , (4,'polo shirt','no description',102),
(5,'spoon','no description',103) , (6,'cooker','no description',103);

select * from pro where cid=102;

update pro
set pid = 50
where pname = 'spoon';

select * from pro;

# gonna update foreign key in on update cascade for updation of cid in both the tables
 
ALTER TABLE pro DROP FOREIGN KEY pro_ibfk_1;

alter table pro
add constraint fk_pro_cate
foreign key (cid) references cate(cid)
on update cascade       # this line helps to update foreign key in both tables    
on delete cascade ;     # this line helps to update foreign key in both tables

update  cate
set cid = 1000
where cid = 102;

select * from pro ;
select * from cate;





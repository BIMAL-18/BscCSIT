-- Create a database name college 
CREATE DATABASE College;
--use college instead of master
use College;
-- Commment on line by using --

--Creating a table name student
CREATE TABLE student
(  
 sid INT PRIMARY KEY,
 sname VARCHAR(20),
 -- USE can use CHAR(20) instead of the varchar(20)
 marks INT,
 --address varchar(30),
 DOB DATE,
 );
 
 
 --Insert any 5 records to student table
 INSERT INTO student
 VALUES( 1,'Bimal',180,'2001-01-01'),
        (2,'pant',120,'2000-05-02');

 -- DISPLAY THE TABLE DATA FROM THE STUDENT
 SELECT sid,sname,marks,DOB
 from student;

 --displat the certain part
 SELECT sname ,marks 
 from student;

 --ALter --
 --used to add the certain row or column in the table--

 ALTER TABLE student
ADD Email VARCHAR(30);

SELECT * from student;


--DROP THE ROW OR COLUMN FROM DATABASE___
ALTER TABLE student
DROP COLUMN marks;
--crete a table for deleting it --
CREATE TABLE BIMAL(
sname varchar(300)
);

--DELETE TABLE FROM THE DATABASE
DROP TABLE BIMAL;

--DROP THE DATABASE
--s
--Rename--
--use to change or rename the database field and column name in the table--

--change the name sid to id 
EXEC sp_rename 'student.sid', 'id', 'column';

--rename he table from the database

EXEC sp_rename 'student', 'students';
select * from students;

INSERT INTO students
VALUES(3,'RAJA','2001-01-01','bimal@gmail.com');
 
 create table test(

 id int,
 name varchar(30),
 adress varchar(30),
 DOB Date,
 email varchar(20),
 marks int,
 Gender varchar(20),
 );

select * from test;


INSERT into students
select id,name,DOB,email
from test;

select * from students;

--order by clause
--this clause is used to sort data in ascending or decending  order--


-- ASC = ascending 

SELECT sname
FROM students
ORDER BY sname ASC;

-- DECS = decending
SELECT sname
FROM students
ORDER BY sname DESC;


--where clause is used to test condition within the field of given table
--Display name of those student whose age less than 20
SELECT  sname 
from students Where sname = 'Bimal';

SELECT  sname 
from students Where DOB <'2005-06-01' ;

-- Display results of all students of address ktm or lalitpur or pokhara

SELECT  sname 
from students Where email = 'bimal@gmail.com'or email = 'NULL';

-- Displagy records of all student ktm and DOB less than 2015-01-01

SELECT  sname 
from students Where email = 'bimal@gmail.com' and DOB <'2005-06-01' ;
--used if more value are used instead of or we used in
SELECT  sname 
from students Where email in('bimal@gmail.com','s@gmail.com') ;
-- not in just opposite of in
SELECT  sname 
from students Where email not in('bimal@gmail.com','s@gmail.com') ;


--like pattern matching (wildcards)

--important % should be used after the start letter to get output
--capital and small letter are different

SELECT  sname 
from students Where email like 'b%' ;

SELECT  sname 
from students Where id like '2' ;
--for getting the value at last or mioddle we used this % at begenning and % at last:)

SELECT  sname 
from students Where email like '%.com%' ;

SELECT  sname 
from students Where DOB like '200%' ;


SELECT  sname 
from students Where sname like '%_.ant' ;

-- disp[lay records all student start with  "A"" or off email of length 7

SELECT  * 
from students Where sname like 'p%' or email like '______________' ;





-- aggregate function take multiple values of a field as a input and return singlke result as a output 
-- commanly used aggregate function are :
-- sum(), avg() , count(), min() , max() ,limit()


-- syntax:
	--SELECT aggregate function (attribute)
	-- from table_name
	-- where conditon


alter table students
Add marks int;

select * from students;

-- count no of student of emainl in @yahoo.com  

select count(id) as 'no_of_student'
from students
where email like '%@yahoo.com';

--- find maximum and minimum marks of students

select max(marks),min(marks)
from students;

-- Select sname  student_name
-- From students
-- Where marks >40;


-- find name and marjs if a oldest student
Select sname  student_name
From student
Where DOB < '2015-01-01';

select sname, marks
from students
where DOB = (select min(DOB) from student);
-- maximum marks

select sname
from students
--where marks = (select max(marks) from student);

--GRoup By clause

-- it is used to divide given table into multiple groups on the basis of value of a particular field 

select avg(marks) as avg , address
from students
Group BY (address);


alter table students
Add address varchar(30);

select * from students;


--Inner join

--is used ti combine rrecords of multiple table into a single table during dispaly of data with related columns (field)

--syntax
	--	select attribute_lists
	-- from table 
	-- inner join table2
	-- on table1 pk = table2.fk
	-- inner join table n
	-- on table2.pk = tablen.fk;


--	find inner join of student and course table


-JOIN OPERATIONS
 --Cross operation

--Course(cid, cname, credithour, teacher name, sid)
   CREATE TABLE course(
   cid varchar(10)  primary key,
   cname varchar(20),
   credithr int,
   teachername varchar(30),
   sid int,
   foreign key(sid) references students(id)
   );
select * from Course;
 select * from students cross join Course;


--Insert a table
Insert into course
values('c1','AI',12,'Abhishek',1);


--Find related records of these two tables.
  Select*
  from students s cross join course c
  where s.id= c.sid;
  
  
  select*
  from course

select *
from students s
inner join course c
on s.id = c.sid

-- find the name and marks of the student while takes 'AI' course

select sname , marks from students s
inner join course c
on s.id = c.sid
where c.cname = 'AI';

-- find coursename in which students get maximum marks

select cname,s.marks from students s
inner join course c
on s.id = c.sid
where  marks = (select max(marks) from students);
 -- left outer join

 select * from students  s 
 left outer join course c
 
 on s.id=c.cid;

 -- find records of all student who study in kmcstudent also

	 --view is a logical representation of a table or group of table which is used data change in the physical table and provide data to the user accroding to the user needs.

	 --advantage of view
	 -- provide data to the user accroding to their needs
	 -- data independency 
	 -- multiple user can access same data 
	 -- create view
	 syntax
	 create view view_name
	 as
	 select attribute_list
	 from table where conditon;


	-- creating a view


	 create view student_view
	 as
	 select sname,marks
	 from students ;


	 select * from student;
	 select * from course_view;


	 DROP VIEW student_view;

	 --create a view  course that contains  student name and course name of all students of dob less than 2015-01- 01 
	create view course_view
	as
	select sname from students 	inner join course 
    on students.id = course.sid
	where dob <'2015-01-01';
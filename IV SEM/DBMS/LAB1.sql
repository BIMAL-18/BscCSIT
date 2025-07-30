CREATE DATABASE LAB1;

USE LAB1;

CREATE TABLE STUDENT (
	SID INT PRIMARY KEY,
	SNAME VARCHAR(25),
	GENDER CHAR(1),
	AGE INT,
	CLASS VARCHAR(20),
	MARKS INT,
	EMAIL VARCHAR(30),
	ADDRESS VARCHAR(35)
);

-- Insert 15 students with full details including email and adress
INSERT INTO STUDENT VALUES  
	(1, 'Bimal Kunwar','M', 19, '12A', 91, 'bimalkunwar@gmail.com', 'Kathmandu'),
	(2, 'Virat Kohli', 'M', 20, '12A', 88, 'viratkohli@gmail.com', 'Mumbai'),
	(3, 'Rohit Sharma', 'M', 20, '12A', 88, 'rohit.sharma@gmail.com', 'Nagpur'),
	(4, 'Kane Williamson', 'M', 18, '12B', 90, 'williamson@gmail.com', 'Wellington'),
	(5, 'Ben Stokes', 'M', 20, '12A', 85, 'bstokes@outlook.com', 'Manchester'),
	(6, 'Smriti Mandhana', 'F', 18, '11A', 93, 'smriti.mandhana@gmail.com', 'Mumbai'),
	(7, 'Ellyse Perry', 'F', 19, '11B', 65, 'ellyseperry@yahoo.com', 'Melbourne'),
	(8, 'Harmanpreet Kaur', 'F', 17, '11B', 84, 'harmanpreet.kaur@gmail.com', 'Mumbai'),
	(9, 'Shubman Gill', 'M', 18, '11A', 78, NULL, 'Ahmedabad'),
	(10, 'Jasprit Bumrah', 'M', 18, '12B', 82, 'bumrah@yahoo.com', 'Ahmedabad'),
	(11, 'Rohit Sharma', 'M', 19, '11A', 88, 'rohit.sharma@gmail.com', 'Nagpur'),
	(12, 'Mithali Raj', 'F', 20, '12A', 73, 'mithaliraj@rediff.com', 'Hyderabad'),
	(13, 'Rashid Khan', 'M', 17, '11B', 90, 'rashidkhan@gmail.com', 'Kabul'),
	(14, 'Meg Lanning', 'F', 19, '12B', 95, 'meglanning@yahoo.com', 'Melbourne'),
	(15, 'Pat Cummins', 'M', 18, '11A', 88, 'cummins@gmail.com', 'Sydney');


--Display all student records with all columns
SELECT * FROM STUDENT;

--Display only SName, Email, and Marks.
SELECT SNAME, EMAIL, MARKS FROM STUDENT;

--Find students who live in a specific city (use LIKE on Address).
SELECT * FROM STUDENT WHERE ADDRESS LIKE 'Mumbai';

--Find students whose email ends with '@gmail.com'.
SELECT * FROM STUDENT WHERE EMAIL LIKE '%@gmail.com';

--Update the Address of a student with a specific SID.
UPDATE STUDENT SET ADDRESS = 'Banglore' WHERE SID = 2;

SELECT *from student

--List all students who scored more than 80 and are under 20 years old.
SELECT * FROM STUDENT WHERE MARKS > 80 AND AGE <=20;

--Count how many students have email addresses from 'yahoo.com'.
SELECT COUNT(*) FROM STUDENT WHERE EMAIL LIKE '%@yahoo.com';

--Find students who have not provided an email (Email IS NULL).
SELECT * FROM STUDENT WHERE EMAIL IS NULL;

--Display all students ordered by SName alphabetically.
SELECT * FROM STUDENT ORDER BY SNAME ASC;

--Group students by Class and show the highest marks in each class.
SELECT CLASS, MAX(MARKS) AS HIGHESTMARK FROM STUDENT GROUP BY CLASS;

--Delete students whose address is 'NULL' or not specified.
DELETE FROM STUDENT WHERE ADDRESS IS NULL; 

--Add a new column PhoneNumber to the student table.
ALTER TABLE STUDENT ADD PHONE VARCHAR(12); 
select * from student


--Create a view ContactList to display SName, Email, and PhoneNumber.
--CREATE VIEW CONTACTLIST AS 
--SELECT SNAME, EMAIL, PHONE FROM STUDENT;
--SELECT * FROM CONTACTLIST;

--CREATE VIEW CONTACTLIST AS SELECT SNAME, EMAIL, PHONE FROM STUDENT;

--Display students whose name starts with 'R' and ends with 'a'.
SELECT * FROM STUDENT WHERE SNAME LIKE 'R%' AND SNAME LIKE '%a';      --'R%a'

--Find the number of students per city (GROUP BY Address).
SELECT  ADDRESS AS CITY,  COUNT(*) AS STUDENTCOUNT FROM STUDENT GROUP BY ADDRESS;

--Count how many male and female students exist (GROUP BY Gender).
SELECT GENDER, COUNT(*) AS GENDERCOUNT FROM STUDENT GROUP BY GENDER;

--Create a trigger to prevent updates to Email once it's entered.


--Find students who have the same address but different names.
SELECT * 
FROM STUDENT 
WHERE ADDRESS IN (
    SELECT ADDRESS 
    FROM STUDENT 
    GROUP BY ADDRESS 
    HAVING COUNT(DISTINCT SNAME) > 1
);



--ORDER BY ADDRESS;


--Rename the column Marks to TotalMarks.
EXEC sp_rename 'STUDENT.MARKS', 'TOTALMARKS', 'COLUMN';
SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'STUDENT';

select * from student
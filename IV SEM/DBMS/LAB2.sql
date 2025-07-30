CREATE DATABASE CollegeMIS;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender CHAR(1),
    DOB DATE,
    DepartmentID INT,
    Email VARCHAR(100),
    --FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
CREATE TABLE Department (
 	   DepartmentID INT PRIMARY KEY,
    DeptName VARCHAR(50)
   );

   CREATE TABLE Course (
 	   CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
 	   DepartmentID INT,
   FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
  ); 

  CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(10),
 	    Marks INT,
  	    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
 	    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
   ); 

   INSERT INTO Department (DepartmentID, DeptName) VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Electronics'),
(4, 'Mechanical');

select * from Student;

INSERT INTO Student
VALUES
(101, 'Monica Adhikari', 'F', '2001-05-15', 1, 'monica@gmail.com'),
(102, 'Bimal Kunwar', 'M', '2000-08-20', 2, 'bimal@yahoo.com'),
(103, 'Laseeb Xettri', 'F', '2002-02-10', 1, 'laseeb@gmail.com'),
(104, 'Ritika Joshi', 'F', '2001-11-11', 3, 'ritika@outlook.com'),
(105, 'Bishal Shrestha', 'M', '2003-04-25', 2, 'bishal@gmail.com');

INSERT INTO Course VALUES
(201, 'Data Structures', 1),
(202, 'DBMS', 1),
(203, 'Computer Networks', 2),
(204, 'Thermodynamics', 4),
(205, 'Digital Logic', 3);

select * from Course;

INSERT INTO Enrollment VALUES
(301, 101, 201, 'Spring', 88),
(302, 102, 203, 'Spring', 76),
(303, 103, 201, 'Fall', 92),
(304, 104, 205, 'Fall', 81),
(305, 105, 202, 'Spring', 85),
(306, 101, 202, 'Fall', 90),
(307, 103, 203, 'Spring', 78),
(308, 102, 201, 'Fall', 82);

select * from Enrollment

SELECT c.CourseName
FROM Course c
JOIN Department d ON c.DepartmentID = d.DepartmentID
WHERE d.DeptName = 'Computer Science';

SELECT s.Name
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Data Structures';

SELECT d.DeptName, COUNT(s.StudentID) AS StudentCount
FROM Department d
LEFT JOIN Student s ON d.DepartmentID = s.DepartmentID
GROUP BY d.DeptName;
SELECT DISTINCT s.Name, e.Marks
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
WHERE e.Marks > 80;

SELECT c.CourseName, AVG(e.Marks) AS AvgMarks
FROM Enrollment e
JOIN Course c ON e.CourseID = c.CourseID
GROUP BY c.CourseName;

SELECT s.Name
FROM Student s
LEFT JOIN Enrollment e ON s.StudentID = e.StudentID
WHERE e.EnrollmentID IS NULL;


SELECT c.CourseName, COUNT(e.StudentID) AS EnrolledStudents
FROM Course c
LEFT JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;

SELECT TOP 1 s.Name, e.Marks
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'DBMS'
ORDER BY e.Marks DESC;

UPDATE Student
SET DepartmentID = 2
WHERE StudentID = 101;

select * from Student

SELECT D.DeptName, COUNT(C.CourseID) AS CourseCount
 FROM Department D
 JOIN Course C ON D.DepartmentID = C.DepartmentID
 GROUP BY D.DeptName
 HAVING COUNT(C.CourseID) > 3;

 SELECT s.Name, COUNT(e.CourseID) * 3 AS TotalCredits
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
GROUP BY s.Name;

CREATE VIEW TopPerformers AS
SELECT s.StudentID, s.Name, AVG(e.Marks) AS AvgMarks
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.Name
HAVING AVG(e.Marks) > 85;

SELECT * FROM TopPerformers;

CREATE VIEW StudentDetails AS
SELECT s.StudentID, s.Name, d.DeptName, s.Email
FROM Student s
JOIN Department d ON s.DepartmentID = d.DepartmentID;

select * from StudentDetails

SELECT s.Name, c.CourseName, e.Marks
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID;

SELECT s.Name
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
GROUP BY s.Name
HAVING COUNT(DISTINCT c.DepartmentID) > 1;

SELECT d.DeptName
FROM Department d
LEFT JOIN Student s ON d.DepartmentID = s.DepartmentID
WHERE s.StudentID IS NULL;

EXEC sp_rename 'Student.DOB', 'DateOfBirth', 'COLUMN';

select * from Student

SELECT DISTINCT s.Name
FROM Student s
JOIN Department d ON s.DepartmentID = d.DepartmentID
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
WHERE d.DeptName = 'Information Technology' AND c.CourseName = 'Computer Networks';


SELECT Name
FROM Student
WHERE Email LIKE '%@gmail.com';


SELECT s.Name, e.Marks
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
WHERE e.Marks > (SELECT AVG(Marks) FROM Enrollment);

SELECT c.CourseName, AVG(e.Marks) AS AvgMarks
FROM Course c
JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;

SELECT s.Name, c.CourseName, e.Marks
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
ORDER BY e.Marks DESC;



-- First alter Enrollment table foreign key to ON DELETE CASCADE
-- Then:
DELETE FROM Course
WHERE CourseName = 'Thermodynamics';

SELECT * FROM Course
WHERE CourseName = 'Thermodynamics';


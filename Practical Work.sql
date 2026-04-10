
CREATE DATABASE PROJECT 

-- Create courses table 

CREATE TABLE Courses ( Course_ID INT PRIMARY KEY,
                       Course_Name VARCHAR(100),
                       Instructor VARCHAR(100),
                       Duration VARCHAR(50))
 
 --Insert the data 

INSERT INTO Courses (Course_ID, Course_Name, Instructor, Duration) VALUES
(101, 'Python Programming', 'John Smith', '3 Months'),
(102, 'Data Science', 'Sam', '6 Months'),
(103, 'Web Development', 'Arun Kumar', '4 Months'),
(104, 'Machine Learning', 'David ', '5 Months'),
(105, 'SQL for Beginners', 'Sneha ', '2 Months'),
(106, 'Java Programming', 'Ravi ', '3 Months'),
(107, 'Cloud Computing', 'Vikram', '4 Months'),
(108, 'Cyber Security', 'Mohan', '5 Months'),
(109, 'Artificial Intelligence', 'Reddy', '6 Months'),
(110, 'UI/UX Design', 'Meera', '3 Months'),
(111, 'Digital Marketing','Priya','5 Months')

--Alter the Fees column

alter table courses add Fees int

--Update the Fees in the table 

UPDATE Courses
SET Fees = CASE Course_ID
    WHEN 101 THEN 5500    
    WHEN 102 THEN 14000   
    WHEN 103 THEN 9000    
    WHEN 104 THEN 16500   
    WHEN 105 THEN 4500    
    WHEN 106 THEN 6600    
    WHEN 107 THEN 11000   
    WHEN 108 THEN 15500   
    WHEN 109 THEN 17500   
    WHEN 110 THEN 7700  
    WHEN 111 THEN 8000
END;

alter table courses drop column Fees

--Delete the courses_ID 111


DELETE FROM courses WHERE course_ID = 111


--Truncate(Delete) the whole record 


TRUNCATE TABLE courses


--Drop the Courses table 


DROP TABLE courses


--Display all data


SELECT *FROM courses


--Show only Course_Name and Instructor and Sort  in descending order


SELECT Course_Name, Instructor FROM Courses ORDER BY Instructor DESC


--Find pattern Matching

SELECT * FROM Courses WHERE Course_Name LIKE 'D%'

SELECT * FROM Courses WHERE Instructor LIKE 'J%'

SELECT * FROM students WHERE NAME LIKE 'S%'


--Count the total number of courses


SELECT COUNT(*) AS Total_Courses FROM Courses


--Top 5 course Name


SELECT TOP 5 Course_Name, Fees
FROM Courses
ORDER BY Fees DESC


-- List all instructors along with the number of courses they teach.

SELECT Instructor, COUNT(Course_ID) AS Number_of_Courses
FROM Courses
GROUP BY Instructor

--Find courses cheaper than 'Python Programming'(Subquery).

SELECT Course_Name, Fees FROM Courses
WHERE Fees < 
(SELECT Fees FROM Courses WHERE Course_Name = 'Python Programming')


--Show courses with fees within a certain range (e.g., 10,000 – 15,000)

SELECT Course_Name, Fees
FROM courses
WHERE Fees BETWEEN 10000 AND 15000;


/*Create a Students table with Student_ID as primary key and 
Course_ID as a foreign key referencing Courses. 
Using JOIN */


CREATE TABLE Students 
   ( Student_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Course_ID INT,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID))


INSERT INTO Students (Student_ID, Name, Email, Course_ID) VALUES
(1, 'Kumar', 'kumar@example.com', 101),
(2, 'Vino', 'vino@example.com', 102),
(3, 'Devika', 'devika@example.com', 103),
(4, 'Anitha', 'anitha@example.com', 104),
(5, 'Singh', 'singh@example.com', 105),
(6, 'Dharshini', 'dharshini@example.com', 106),
(7, 'Sharmila', 'sharmila@example.com', 107),
(8, 'Madhu', 'madhu@example.com', 108),
(9, 'Veera', 'veera@example.com', 109),
(10,'Nithiya', 'nithiya@example.com', 110)


SELECT*FROM students

--Join the Courses and Students Tables

SELECT s.Name, c.Course_Name, c.Instructor
FROM Students s
JOIN Courses c ON s.Course_ID = c.Course_ID

--Show the total fees collected from all students per course.

SELECT 
    C.Course_Name,
    S.Name AS Student_Name,
    C.Fees
FROM 
    Students S
JOIN 
    Courses C ON S.Course_ID = C.Course_ID
ORDER BY 
    C.Course_Name ASC, 
    S.Name;



--Update a course fee using a stored procedure.


CREATE PROCEDURE Update_CourseFee
    @Course_ID INT,
    @New_Fee INT
AS
BEGIN
    UPDATE Courses
    SET Fees = @New_Fee
    WHERE Course_ID = @Course_ID;
END;

EXEC Update_CourseFee @Course_ID = 101, @New_Fee = 12000;

SELECT*FROM Courses


Truncate table students


INSERT INTO Students (Student_ID, Name, Email, Course_ID) VALUES
(1, 'Kumar', 'kumar@example.com', 101),
(2, 'Vino', 'vino@example.com', 102),
(3, 'Devika', 'devika@example.com', 103),
(4, 'Anitha', 'anitha@example.com', 104),
(5, 'Singh', 'singh@example.com', 105),
(6, 'Dharshini', 'dharshini@example.com', 106),
(7, 'Sharmila', 'sharmila@example.com', 107),
(8, 'Madhu', 'madhu@example.com', 108),
(9, 'Veera', 'veera@example.com', 109),
(10,'Nithiya', 'nithiya@example.com', 110)



SELECT*FROM students

--Insert a new student and cancel the operation using ROLLBACK.


BEGIN TRANSACTION;

INSERT INTO Students (Student_ID, Name, Email, Course_ID)
VALUES (11, 'Arun', 'arun@example.com', 101);

ROLLBACK;


SELECT*FROM students


--Insert a new student and save the changes using COMMIT.


BEGIN TRANSACTION;

INSERT INTO Students (Student_ID, Name, Email, Course_ID)
VALUES (11, 'Arun', 'arun@example.com', 101);

COMMIT;



--Log deleted student details using a DELETE trigger.


CREATE TABLE Student_Log (
    Log_ID INT IDENTITY(1,1) PRIMARY KEY,
    Student_ID INT,
    Name VARCHAR(100),
    Action VARCHAR(50),
    Action_Time DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER trg_AfterDeleteStudent
ON Students
AFTER DELETE
AS
BEGIN
    INSERT INTO Student_Log (Student_ID, Name, Action)
    SELECT Student_ID, Name, 'DELETE'
    FROM DELETED;
END;


DELETE FROM Students
WHERE Student_ID = 11;

SELECT*FROM students
SELECT*FROM Student_Log

truncate table student_Log



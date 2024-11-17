-- Show all databases
SHOW databases;

-- Create the database
CREATE DATABASE Student_information_system;

-- Show all databases
SHOW DATABASES;

-- Use the created database
USE student_information_system;

-- Create the Login table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_role ENUM('staff', 'student')
);

-- describe the structure of table
DESC Users;

-- Insert the values on table
INSERT INTO Users ( user_id, username, password, user_role )
VALUES
(001, 'john_doe', 'password123', 'staff'),
(002, 'alice_smith', 'alicepwd456', 'student'),
(003, 'michael_lee', 'mikepass789', 'staff'),
(004, 'emma_jones', 'emma@2023', 'student'),
(005, 'david_brown', 'davepwd101', 'staff');

-- Retrieve data from the database
SELECT * FROM Users;

-- Create the Student Table
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    dob DATE,
    gender ENUM('Male', 'Female', 'Others'),
    address VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(50)
);

-- describe the structure of table
DESC Student;

-- Insert the values on table
INSERT INTO Student (name, dob, gender, address, phone, email) 
VALUES
    ('John Doe', '2001-03-15', 'Male', '123 Elm Street, Cityville', '9873748343', 'johndoe@email.com'),
    ('Jane Smith', '2000-06-22', 'Female', '456 Oak Avenue, Townsville', '9823732376', 'janesmith@email.com'),
    ('Alex Taylor', '2002-11-30', 'Male', '789 Pine Road, Villagetown', '9654539876', 'alextaylor@email.com'),
    ('Emily Johnson', '1999-09-12', 'Female', '101 Maple Street, Hamlet', '9254584321', 'emilyj@email.com'),
    ('Sam Lee', '2003-01-05', 'Others', '202 Birch Lane, Metropolis', '9137487651', 'samlee@email.com');

-- Retrieve data from the database
SELECT * FROM Student;

-- Create the Fees Table
CREATE TABLE Fees (
    fee_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    total_fee DECIMAL(10, 2),
    paid_amount DECIMAL(10, 2),
    due_date DATE,
    status ENUM('Paid', 'Unpaid') DEFAULT 'Unpaid',
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

-- describe the structure of table
DESC Fees;

-- Insert the values on table
INSERT INTO Fees (student_id, total_fee, paid_amount, due_date, status)
VALUES
    (1, 1500.00, 500.00, '2024-12-15', 'Unpaid'),
    (2, 1200.00, 1200.00, '2024-11-20', 'Paid'),
    (3, 1800.00, 900.00, '2024-12-01', 'Unpaid'),
    (4, 1000.00, 1000.00, '2024-10-25', 'Paid'),
    (5, 2000.00, 0.00, '2024-11-10', 'Unpaid');

-- Retrieve data from the database
SELECT * FROM Fees;

-- Create the Marks Table
CREATE TABLE Marks (
    mark_id INT auto_increment PRIMARY KEY,
    student_id INT NOT NULL,
    tamil_marks INT CHECK (tamil_marks BETWEEN 0 AND 100),
    english_marks INT CHECK (english_marks BETWEEN 0 AND 100),
    maths_marks INT CHECK (maths_marks BETWEEN 0 AND 100),
    science_marks INT CHECK (science_marks BETWEEN 0 AND 100),
    social_marks INT CHECK (social_marks BETWEEN 0 AND 100),
    total_marks INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE
);


-- describe the structure of table
DESC Marks;

-- Insert the values on table
INSERT INTO Marks (student_id, tamil_marks, english_marks, maths_marks, science_marks, social_marks, total_marks, grade)
VALUES
    (1, 85, 90, 88, 92, 80, 435, 'A'),
    (2, 78, 82, 75, 80, 88, 403, 'B'),
    (3, 90, 85, 92, 87, 80, 434, 'A'),
    (4, 70, 75, 80, 79, 72, 376, 'C'),
    (5, 88, 91, 85, 93, 86, 443, 'A');


-- Retrieve data from the database
SELECT * FROM Marks;



-- Operations based on the current Student Information System design to: 
-- 1.	Add a New Student 
-- 2.	Update a Student details
-- 3.	Remove a Student 
-- 4.	Mark Entry
-- 5.	View Entire Student Details 


-- 1. Add a New Student on existing table

INSERT INTO Student (name, dob, gender, address, phone, email) 
VALUES
    ('Alen Doe', '2002-08-25', 'Male', '123 Elm Street, Chimong', '9172542343', 'alendoe@email.com');

-- After add a New Student, Retrieve data from the database
Select * from Student;




-- 2. Update a Student details
INSERT INTO Fees (student_id, total_fee, paid_amount, due_date, status)
VALUES
    (6, 1500.00, 700.00, '2024-12-28', 'Unpaid');

INSERT INTO Marks (mark_id, student_id, tamil_marks, english_marks, maths_marks, science_marks, social_marks, total_marks, grade)
VALUES
    (6, 6, 90, 80, 83, 87, 85, 425, 'B');
    
-- Check the updated data of New Student
Select * from Fees;

Select * from Marks;



-- 3. Remove a Student from Database
DELETE FROM Student WHERE student_id = 2;
DELETE FROM Fees WHERE student_id = 2;

-- Check after the data is deleted
Select * from Fees;
select * from Student;
Select * from Marks;




-- 4. Mark Entry
INSERT INTO Marks (mark_id, student_id, tamil_marks, english_marks, maths_marks, science_marks, social_marks, total_marks, grade)
VALUES
    (7, 7, 90, 80, 83, 87, 85, 425, 'B');alter
    
Select * from Marks;





-- 5. View Entire Student Details 

SELECT 
  s.student_id,
  s.name,
  s.dob,
  s.gender,
  s.address,
  s.phone,
  s.email,
  f.fee_id,
  f.total_fee,
  f.paid_amount,
  f.due_date,
  f.status,
  m.mark_id,
  m.tamil_marks,
  m.english_marks,
  m.maths_marks,
  m.science_marks,
  m.social_marks,
  m.total_marks,
  m.grade
FROM 
  Student s
JOIN 
  Marks m ON s.student_id = m.student_id
JOIN 
  Fees f ON s.student_id = f.student_id
WHERE 
  s.student_id = 4;


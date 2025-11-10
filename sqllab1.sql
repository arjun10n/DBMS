-- ======================================
-- UNIVERSITY MANAGEMENT SYSTEM (DDL SCRIPT)
-- ======================================

-- 1️⃣ Create Database
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- 2️⃣ Create Tables

-- Table: Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

-- Table: Professors
CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY AUTO_INCREMENT,
    ProfessorName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ======================================
-- DDL OPERATIONS (ALTER TABLE)
-- ======================================

-- 3️⃣ Add a new column "PhoneNumber" to Students table
ALTER TABLE Students
ADD PhoneNumber VARCHAR(15);

-- 4️⃣ Modify "CourseName" column in Courses to allow up to 150 characters
ALTER TABLE Courses
MODIFY CourseName VARCHAR(150);

-- 5️⃣ Remove the "Salary" column from Professors table
ALTER TABLE Professors
DROP COLUMN Salary;

-- ======================================
-- Example SELECT statements (optional verification)
-- ======================================
SELECT * FROM Departments;
SELECT * FROM Professors;
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

-- ======================================
-- DDL CLEANUP (DROP)
-- ======================================

-- 6️⃣ Drop all tables (optional)
-- Uncomment below lines if you want to drop tables after testing
-- DROP TABLE Enrollments;
-- DROP TABLE Courses;
-- DROP TABLE Students;
-- DROP TABLE Professors;
-- DROP TABLE Departments;


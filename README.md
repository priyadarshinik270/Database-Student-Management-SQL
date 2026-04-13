# 🎓 Student Management System (SQL Project)

## 📌 Project Overview

This project is a SQL-based Student Management System designed to manage course and student data efficiently. It demonstrates core database operations, relationships, and advanced SQL concepts such as transactions, triggers, and stored procedures.

---

## 📊 Data Source

The data used in this project was collected and organized using Microsoft Excel. After preprocessing and cleaning, it was imported into SQL Server for further database operations.

---

## 🗂️ Database Structure

### 📘 Courses Table

* Course_ID (Primary Key)
* Course_Name
* Instructor
* Duration
* Fees

### 👩‍🎓 Students Table

* Student_ID (Primary Key)
* Name
* Email
* Course_ID (Foreign Key)

### 📝 Student_Log Table

* Log_ID (Primary Key)
* Student_ID
* Name
* Action (INSERT / DELETE)
* Action_Time

---

## ⚙️ Features Implemented

* ✅ Table creation with constraints (Primary Key, Foreign Key)
* ✅ Data insertion, update, and deletion
* ✅ Pattern matching using LIKE
* ✅ Aggregate functions (COUNT)
* ✅ Sorting and filtering data
* ✅ JOIN operations between tables
* ✅ Subqueries
* ✅ Transactions (COMMIT & ROLLBACK)
* ✅ Stored Procedures
* ✅ Triggers for logging deleted records

---

## 🔄 Key Functionalities

### 🔹 Transactions

* Used `COMMIT` to save changes permanently
* Used `ROLLBACK` to undo operations

### 🔹 Stored Procedure

* Update course fees dynamically using parameters

### 🔹 Trigger

* Automatically logs deleted student records into `Student_Log` table

---

## 🚀 Sample Queries

### 🔹 Join Example

```sql
SELECT s.Name, c.Course_Name, c.Instructor
FROM Students s
JOIN Courses c ON s.Course_ID = c.Course_ID;
```

### 🔹 Trigger Example

```sql
CREATE TRIGGER trg_AfterDeleteStudent
ON Students
AFTER DELETE
AS
BEGIN
    INSERT INTO Student_Log (Student_ID, Name, Action)
    SELECT Student_ID, Name, 'DELETE'
    FROM DELETED;
END;
```

---

## 🛠️ Technologies Used

* SQL Server
* T-SQL
* Microsoft Excel (Data Collection)

---

## ▶️ How to Run the Project

1. Create database using:

   ```sql
   CREATE DATABASE PROJECT;
   ```
2. Run table creation scripts
3. Insert data into tables
4. Execute queries, procedures, and triggers step by step

---

## 📌 Key Concepts Covered

* Relational Database Design
* Data Integrity
* Transactions & Concurrency
* Automation using Triggers
* Query Optimization Basics

---

## 🌟 Project Description 

A SQL-based Student Management System demonstrating CRUD operations, joins, transactions, triggers, and stored procedures with data sourced from Excel.


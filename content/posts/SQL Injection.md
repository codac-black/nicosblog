---
title: SQL Injection 💉
date: 2024-12-09
draft: false
tags:
  - sql
  - hacking
---

# 1. What is SQL?

SQL is a standardized (ANSI in 1986, ISO in 1987) programming language which is used for managing relational databases and performing various operations on the data in them.

Example SQL table containing employee data; the name of the table is 'employees':


| userid | first_name | last_name | department  | salary($) | auth_tan |
| ------ | ---------- | --------- | ----------- | --------- | -------- |
| 32147  | Paulina    | Traves    | Accounting  | 46.000    | P45JSI   |
| 89762  | Tobi       | Barnett   | Development | 77.000    | TA9LL1   |
| 96134  | Bob        | Franco    | Marketing   | 83.700    | LO9S2V   |
| 34477  | Abraham    | Holman    | Development | 50.000    | UU2ALK   |
| 37648  | John       | Smith     | Marketing   | 64.350    | 3SL99A   |

A company saves the following employee information in their databases: a unique employee number ('userid'), last name, first name, department, salary and a transaction authentication number ('auth_tan'). Each of these pieces of information is stored in a separate column and each row represents one employee of the company.

SQL queries can be used to modify a database table and its index structures and add, update and delete rows of data.

There are three main categories of SQL commands:

- Data Manipulation Language (DML)
    
- Data Definition Language (DDL)
    
- Data Control Language (DCL)
    

Each of these command types can be used by attackers to compromise the confidentiality, integrity, and/or availability of a system. Proceed with the lesson to learn more about the SQL command types and how they relate to protections goals.

### It is your turn!

Look at the example table. Try to retrieve the department of the employee Bob Franco. Note that you have been granted full administrator privileges in this assignment and can access all data without authentication.

### Solution

```sql
SELECT department FROM employees WHERE first_name = 'Bob' AND last_name = 'Franco';
```


# 2. Data Manipulation Language (DML)

As implied by the name, data manipulation language deals with the manipulation of data. Many of the most common SQL statements, including SELECT, INSERT, UPDATE, and DELETE, may be categorized as DML statements. DML statements may be used for requesting records (SELECT), adding records (INSERT), deleting records (DELETE), and modifying existing records (UPDATE).

If an attacker succeeds in "injecting" DML statements into a SQL database, he can violate the confidentiality (using SELECT statements), integrity (using UPDATE statements), and availability (using DELETE or UPDATE statements) of a system.

- DML commands are used for storing, retrieving, modifying, and deleting data.
    
- SELECT - retrieve data from a database
    
- INSERT - insert data into a database
    
- UPDATE - updates existing data within a database
    
- DELETE - delete records from a database
    
- Example:
    
    - Retrieve data:
        
```sql
     SELECT phone  
     FROM employees  
     WHERE userid = 96134;
```
        
    - This statement retrieves the phone number of the employee who has the userid 96134.
        
    

### It is your turn!

Try to change the department of Tobi Barnett to 'Sales'. Note that you have been granted full administrator privileges in this assignment and can access all data without authentication.

### solution

```sql
-- UPDATING TOBI DEPARTMENT RECORD
UPDATE employees
SET department = 'Sales'
WHERE first_name = 'Tobi' AND last_name = 'Barnett';
```


# 4. Data Definition Language (DDL)

Data definition language includes commands for defining data structures. DDL commands are commonly used to define a database’s schema. The schema refers to the overall structure or organization of the database and. in SQL databases, includes objects such as tables, indexes, views, relationships, triggers, and more.

If an attacker successfully "injects" DDL type SQL commands into a database, he can violate the integrity (using ALTER and DROP statements) and availability (using DROP statements) of a system.

- DDL commands are used for creating, modifying, and dropping the structure of database objects.
    
- CREATE - create database objects such as tables and views
    
- ALTER - alters the structure of the existing database
    
- DROP - delete objects from the database
    
- Example:
    
```sql
     CREATE TABLE employees(  
            userid varchar(6) not null primary key, 
            first_name varchar(20),  
            last_name varchar(20),  
            department varchar(20),  
            salary varchar(10),  
            auth_tan varchar(6)  
        );
```
        
    - This statement creates the employees example table given on page 2.
        
    

Now try to modify the schema by adding the column "phone" (varchar(20)) to the table "employees". :

### Solution

syntax for altering table is 

```
ALTER TABLE table_name
ADD column_you_want_to_add datatype
```

```sql
ALTER TABLE employees
ADD phone varchar(20);

```


# 5. Data Control Language (DCL)

Data control language is used to implement access control logic in a database. DCL can be used to revoke and grant user privileges on database objects such as tables, views, and functions.

If an attacker successfully "injects" DCL type SQL commands into a database, he can violate the confidentiality (using GRANT commands) and availability (using REVOKE commands) of a system. For example, the attacker could grant himself admin privileges on the database or revoke the privileges of the true administrator.

- DCL commands are used to implement access control on database objects.
    
- GRANT - give a user access privileges on database objects
    
- REVOKE - withdraw user privileges that were previously given using GRANT
    

Try to grant rights to the table ==`grant_rights`== to user ==`unauthorized_user`==:

```

```
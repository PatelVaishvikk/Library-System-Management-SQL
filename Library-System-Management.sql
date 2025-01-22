DROP TABLE IF EXISTS branch;
CREATE TABLE branch
(
            branch_id VARCHAR(10) PRIMARY KEY,
            manager_id VARCHAR(10),
            branch_address VARCHAR(30),
            contact_no VARCHAR(15)
);


-- Create table "Employee"
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
            emp_id VARCHAR(10) PRIMARY KEY,
            emp_name VARCHAR(30),
            position VARCHAR(30),
            salary DECIMAL(10,2),
            branch_id VARCHAR(10) --FK
          
);


-- Create table "Members"
DROP TABLE IF EXISTS members;
CREATE TABLE members
(
            member_id VARCHAR(10) PRIMARY KEY,
            member_name VARCHAR(30),
            member_address VARCHAR(30),
            reg_date DATE
);



-- Create table "Books"
DROP TABLE IF EXISTS books;
CREATE TABLE books
(
            isbn VARCHAR(50) PRIMARY KEY,
            book_title VARCHAR(80),
            category VARCHAR(30),
            rental_price DECIMAL(10,2),
            status VARCHAR(10),
            author VARCHAR(30),
            publisher VARCHAR(30)
);



-- Create table "IssueStatus"
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(
            issued_id VARCHAR(10) PRIMARY KEY,
            issued_member_id VARCHAR(30), -- FK
            issued_book_name VARCHAR(80),
            issued_date DATE,
            issued_book_isbn VARCHAR(50), -- FK
            issued_emp_id VARCHAR(10) --FK
          
);



-- Create table "ReturnStatus"
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
            return_id VARCHAR(10) PRIMARY KEY,
            issued_id VARCHAR(30),
            return_book_name VARCHAR(80),
            return_date DATE,
            return_book_isbn VARCHAR(50)
           
);




ALTER TABLE issued_status 
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);


ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id)


ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id)



ALTER TABLE return_status
ADD CONSTRAINT fk_return_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id)

ALTER TABLE return_status
ADD CONSTRAINT fk_return_status
FOREIGN KEY (return_book_isbn)
REFERENCES books(isbn)

ALTER TABLE return_status
DROP CONSTRAINT fk_return_status;

COPY branch(branch_id, manager_id, branch_address, contact_no)
FROM 'C:/Drive(D)/Library Management System using SQL/DATA/branch.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

COPY employees(emp_id, emp_name, position, salary, branch_id)
FROM 'C:/Drive(D)/Library Management System using SQL/DATA/employees.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

COPY members(member_id, member_name, member_address, reg_date)
FROM 'C:/Drive(D)/Library Management System using SQL/DATA/members.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

COPY books(isbn, book_title, category, rental_price, status, author, publisher)
FROM 'C:/Drive(D)/Library Management System using SQL/DATA/books.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

COPY issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id)
FROM 'C:/Drive(D)/Library Management System using SQL/DATA/issued_status.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

COPY return_status(return_id, issued_id, return_book_name, return_date, return_book_isbn)
FROM 'C:/Drive(D)/Library Management System using SQL/DATA/return_status.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

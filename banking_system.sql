CREATE DATABASE banking_system;
USE banking_system;

-- 1. Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(100),
    dob DATE
);

-- 2. Branches table
CREATE TABLE Branches (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100),
    location VARCHAR(255)
);

-- 3. Accounts table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    branch_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    created_at DATETIME,
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id)
);

-- 4. Transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    amount DECIMAL(12,2),
    type ENUM('credit', 'debit'),
    transaction_date DATETIME,
    FOREIGN KEY (account_id)
        REFERENCES Accounts(account_id)
);

-- 5. Loans table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    amount DECIMAL(12,2),
    loan_type VARCHAR(50),
    interest_rate DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

-- 6. Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    name VARCHAR(100),
    designation VARCHAR(50),
    salary DECIMAL(12,2),
    FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id)
);
SHOW TABLES;

USE banking_system;

-- 1. Insert branches first
INSERT INTO Branches (branch_name, location) VALUES
('Hyderabad Main', 'Hyderabad'),
('Vijayawada Branch', 'Vijayawada'),
('Guntur Branch', 'Guntur');

-- 2. Insert customers
INSERT INTO Customers (name, address, phone, email, dob) VALUES
('Rahul Sharma', 'Hyderabad', '9876500001', 'rahul@gmail.com', '1997-05-12'),
('Priya Reddy', 'Hyderabad', '9876500002', 'priya@gmail.com', '2000-08-21'),
('Arjun Kumar', 'Vijayawada', '9876500003', 'arjun@gmail.com', '1995-03-15'),
('Sneha Rao', 'Guntur', '9876500004', 'sneha@gmail.com', '1999-11-30'),
('Kiran Varma', 'Hyderabad', '9876500005', 'kiran@gmail.com', '2001-01-10'),
('Ananya Das', 'Vijayawada', '9876500006', 'ananya@gmail.com', '1996-07-04');

-- 3. Insert accounts
INSERT INTO Accounts
(customer_id, branch_id, account_type, balance, created_at) VALUES
(1, 1, 'Savings', 75000.00, '2024-01-10 10:00:00'),
(2, 1, 'Current', 45000.00, '2024-02-15 11:30:00'),
(3, 2, 'Savings', 120000.00, '2024-03-20 09:15:00'),
(4, 3, 'Current', 65000.00, '2024-04-05 14:00:00'),
(5, 1, 'Savings', 30000.00, '2024-05-12 12:45:00'),
(6, 2, 'Fixed Deposit', 95000.00, '2024-06-18 16:20:00');

-- 4. Insert transactions
INSERT INTO Transactions
(account_id, amount, type, transaction_date) VALUES
(1, 10000.00, 'credit', '2024-07-01 10:00:00'),
(1, 2500.00, 'debit', '2024-07-02 11:00:00'),
(2, 5000.00, 'credit', '2024-07-03 12:00:00'),
(3, 20000.00, 'credit', '2024-07-04 13:00:00'),
(4, 3000.00, 'debit', '2024-07-05 14:00:00'),
(5, 7000.00, 'credit', '2024-07-06 15:00:00'),
(6, 1500.00, 'debit', '2024-07-07 16:00:00');

-- 5. Insert loans
INSERT INTO Loans
(customer_id, amount, loan_type, interest_rate, start_date, end_date) VALUES
(1, 500000.00, 'Home Loan', 8.50, '2024-01-01', '2044-01-01'),
(2, 200000.00, 'Personal Loan', 11.25, '2024-02-01', '2029-02-01'),
(3, 750000.00, 'Home Loan', 8.25, '2024-03-01', '2044-03-01'),
(5, 150000.00, 'Education Loan', 7.50, '2024-04-01', '2030-04-01');

-- 6. Insert employees
INSERT INTO Employees
(branch_id, name, designation, salary) VALUES
(1, 'Suresh Reddy', 'Manager', 65000.00),
(1, 'Meena Sharma', 'Cashier', 35000.00),
(2, 'Ravi Kumar', 'Branch Manager', 55000.00),
(2, 'Divya Rao', 'Accountant', 42000.00),
(3, 'Venkatesh Das', 'Clerk', 30000.00);

SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;

USE banking_system;

SELECT COUNT(*) AS total_customers FROM Customers;
SELECT COUNT(*) AS total_branches FROM Branches;
SELECT COUNT(*) AS total_accounts FROM Accounts;
SELECT COUNT(*) AS total_transactions FROM Transactions;
SELECT COUNT(*) AS total_loans FROM Loans;
SELECT COUNT(*) AS total_employees FROM Employees;
SELECT * FROM Transactions;

INSERT INTO Transactions
(account_id, amount, type, transaction_date)
VALUES
(1, 10000.00, 'credit', '2024-07-01 10:00:00'),
(1, 2500.00, 'debit', '2024-07-02 11:00:00'),
(2, 5000.00, 'credit', '2024-07-03 12:00:00'),
(3, 20000.00, 'credit', '2024-07-04 13:00:00'),
(4, 3000.00, 'debit', '2024-07-05 14:00:00'),
(5, 7000.00, 'credit', '2024-07-06 15:00:00'),
(6, 1500.00, 'debit', '2024-07-07 16:00:00');
SELECT * FROM Transactions;

USE banking_system;

INSERT INTO Branches (branch_id, branch_name, location)
VALUES
(4, 'Secunderabad Branch', 'Secunderabad'),
(5, 'Bengaluru Branch', 'Bengaluru')
ON DUPLICATE KEY UPDATE branch_id = branch_id;

SELECT * FROM Branches;

INSERT INTO Customers
(customer_id, name, address, phone, email, dob)
VALUES
(7, 'Akhil Reddy', 'Hyderabad', '9000000007', 'akhil@example.com', '1999-04-15'),
(8, 'Pooja Sharma', 'Bengaluru', '9000000008', 'pooja@example.com', '1997-08-20'),
(9, 'Manoj Kumar', 'Chennai', '9000000009', 'manoj@example.com', '1996-02-10'),
(10, 'Divya Rao', 'Mumbai', '9000000010', 'divya@example.com', '2000-12-05'),
(11, 'Karthik Reddy', 'Hyderabad', '9000000011', 'karthik@example.com', '1995-06-18'),
(12, 'Siri Lakshmi', 'Vijayawada', '9000000012', 'siri@example.com', '2001-03-22'),
(13, 'Naveen Kumar', 'Guntur', '9000000013', 'naveen@example.com', '1998-09-14'),
(14, 'Keerthi Das', 'Chennai', '9000000014', 'keerthi@example.com', '1999-11-11'),
(15, 'Rohit Verma', 'Bengaluru', '9000000015', 'rohit@example.com', '1994-01-25'),
(16, 'Anusha Reddy', 'Hyderabad', '9000000016', 'anusha@example.com', '2002-07-19'),
(17, 'Vamsi Krishna', 'Mumbai', '9000000017', 'vamsi@example.com', '1997-05-30'),
(18, 'Meghana Rao', 'Vijayawada', '9000000018', 'meghana@example.com', '2000-10-08'),
(19, 'Sandeep Kumar', 'Guntur', '9000000019', 'sandeep@example.com', '1996-04-12'),
(20, 'Harika Sharma', 'Hyderabad', '9000000020', 'harika@example.com', '1998-12-28')
ON DUPLICATE KEY UPDATE customer_id = customer_id;

SELECT COUNT(*) AS total_customers FROM Customers;

USE banking_system;

INSERT INTO Accounts
(account_id, customer_id, branch_id, account_type, balance, created_at)
VALUES
(7, 7, 1, 'Savings', 85000.00, '2025-01-07 10:00:00'),
(8, 8, 5, 'Current', 42000.00, '2025-01-08 10:00:00'),
(9, 9, 4, 'Savings', 135000.00, '2025-01-09 10:00:00'),
(10, 10, 5, 'Fixed Deposit', 95000.00, '2025-01-10 10:00:00'),
(11, 11, 1, 'Savings', 25000.00, '2025-01-11 10:00:00'),
(12, 12, 2, 'Current', 68000.00, '2025-01-12 10:00:00'),
(13, 13, 3, 'Savings', 55000.00, '2025-01-13 10:00:00'),
(14, 14, 4, 'Fixed Deposit', 110000.00, '2025-01-14 10:00:00'),
(15, 15, 5, 'Current', 38000.00, '2025-01-15 10:00:00'),
(16, 16, 1, 'Savings', 72000.00, '2025-01-16 10:00:00'),
(17, 17, 5, 'Fixed Deposit', 145000.00, '2025-01-17 10:00:00'),
(18, 18, 2, 'Savings', 49000.00, '2025-01-18 10:00:00'),
(19, 19, 3, 'Current', 62000.00, '2025-01-19 10:00:00'),
(20, 20, 1, 'Savings', 90000.00, '2025-01-20 10:00:00')
ON DUPLICATE KEY UPDATE account_id = account_id;

SELECT COUNT(*) AS total_accounts FROM Accounts;

USE banking_system;

INSERT INTO Transactions
(transaction_id, account_id, amount, type, transaction_date)
VALUES
(8, 7, 12000.00, 'credit', '2025-02-01 10:00:00'),
(9, 8, 3500.00, 'debit', '2025-02-02 11:00:00'),
(10, 9, 18000.00, 'credit', '2025-02-03 12:00:00'),
(11, 10, 7500.00, 'debit', '2025-02-04 13:00:00'),
(12, 11, 4200.00, 'credit', '2025-02-05 14:00:00'),
(13, 12, 9000.00, 'debit', '2025-02-06 15:00:00'),
(14, 13, 15000.00, 'credit', '2025-02-07 16:00:00'),
(15, 14, 6200.00, 'debit', '2025-02-08 10:00:00'),
(16, 15, 11000.00, 'credit', '2025-02-09 11:00:00'),
(17, 16, 2800.00, 'debit', '2025-02-10 12:00:00'),
(18, 17, 22000.00, 'credit', '2025-02-11 13:00:00'),
(19, 18, 4600.00, 'debit', '2025-02-12 14:00:00'),
(20, 19, 13500.00, 'credit', '2025-02-13 15:00:00'),
(21, 20, 5100.00, 'debit', '2025-02-14 16:00:00'),
(22, 1, 8000.00, 'credit', '2025-02-15 10:00:00'),
(23, 2, 2400.00, 'debit', '2025-02-16 11:00:00'),
(24, 3, 17000.00, 'credit', '2025-02-17 12:00:00'),
(25, 4, 6500.00, 'debit', '2025-02-18 13:00:00'),
(26, 5, 9500.00, 'credit', '2025-02-19 14:00:00'),
(27, 6, 3200.00, 'debit', '2025-02-20 15:00:00'),
(28, 7, 14000.00, 'credit', '2025-02-21 16:00:00'),
(29, 8, 4100.00, 'debit', '2025-02-22 10:00:00'),
(30, 9, 19000.00, 'credit', '2025-02-23 11:00:00')
ON DUPLICATE KEY UPDATE transaction_id = transaction_id;

SELECT COUNT(*) AS total_transactions FROM Transactions;

USE banking_system;

INSERT INTO Loans
(loan_id, customer_id, amount, loan_type,
 interest_rate, start_date, end_date)
VALUES
(5, 5, 300000.00, 'Home Loan', 8.25,
 '2024-05-01', '2044-05-01'),
(6, 6, 100000.00, 'Personal Loan', 11.50,
 '2024-06-01', '2029-06-01'),
(7, 7, 250000.00, 'Education Loan', 7.50,
 '2024-07-01', '2030-07-01'),
(8, 8, 450000.00, 'Home Loan', 8.00,
 '2024-08-01', '2044-08-01'),
(9, 9, 175000.00, 'Personal Loan', 10.75,
 '2024-09-01', '2029-09-01'),
(10, 10, 200000.00, 'Education Loan', 7.25,
 '2024-10-01', '2030-10-01')
ON DUPLICATE KEY UPDATE loan_id = loan_id;

SELECT COUNT(*) AS total_loans FROM Loans;

INSERT INTO Employees
(employee_id, branch_id, name, designation, salary)
VALUES
(6, 1, 'Prakash Rao', 'Manager', 70000.00),
(7, 2, 'Lakshmi Devi', 'Cashier', 32000.00),
(8, 3, 'Ramesh Kumar', 'Accountant', 45000.00),
(9, 4, 'Swathi Reddy', 'Clerk', 28000.00),
(10, 5, 'Ajay Sharma', 'Branch Manager', 60000.00)
ON DUPLICATE KEY UPDATE employee_id = employee_id;

SELECT COUNT(*) AS total_employees FROM Employees;

SELECT 'Customers' AS table_name, COUNT(*) AS total
FROM Customers
UNION ALL
SELECT 'Branches', COUNT(*) FROM Branches
UNION ALL
SELECT 'Accounts', COUNT(*) FROM Accounts
UNION ALL
SELECT 'Transactions', COUNT(*) FROM Transactions
UNION ALL
SELECT 'Loans', COUNT(*) FROM Loans
UNION ALL
SELECT 'Employees', COUNT(*) FROM Employees;
USE banking_system;

-- Query 1: Display all records from the Customers table.
SELECT *
FROM Customers;


-- Query 2: Display the name, phone number, and email of all customers.
SELECT name, phone, email
FROM Customers;


-- Query 3: Display all customers who are from Hyderabad.
SELECT *
FROM Customers
WHERE address = 'Hyderabad';


-- Query 4: Display all accounts whose account_type is Savings.
SELECT *
FROM Accounts
WHERE account_type = 'Savings';


-- Query 5: Display all accounts having a balance greater than 50000.
SELECT *
FROM Accounts
WHERE balance > 50000;


-- Query 6: Display all transactions where the transaction type is credit.
SELECT *
FROM Transactions
WHERE type = 'credit';


-- Query 7: Display all employees whose salary is greater than 40000.
SELECT *
FROM Employees
WHERE salary > 40000;


-- Query 8: Display all customers born after 1998-01-01.
SELECT *
FROM Customers
WHERE dob > '1998-01-01';


-- Query 9: Display all accounts in descending order of their balance.
SELECT *
FROM Accounts
ORDER BY balance DESC;


-- Query 10: Find the total number of customers in the bank.
SELECT COUNT(*) AS total_customers
FROM Customers;


-- Query 11: Find the total balance of all accounts.
SELECT SUM(balance) AS total_balance
FROM Accounts;


-- Query 12: Find the average account balance.
SELECT AVG(balance) AS average_balance
FROM Accounts;


-- Query 13: Find the highest and lowest account balance.
SELECT
    MAX(balance) AS highest_balance,
    MIN(balance) AS lowest_balance
FROM Accounts;


-- Query 14: Display the number of accounts for each account_type.
SELECT
    account_type,
    COUNT(*) AS total_accounts
FROM Accounts
GROUP BY account_type;


-- Query 15: Display each account type and its total balance,
-- but show only account types whose total balance is greater than 80000.
SELECT
    account_type,
    SUM(balance) AS total_balance
FROM Accounts
GROUP BY account_type
HAVING SUM(balance) > 80000;


-- Query 16: Display customer name, account ID, account type, and balance using Customers and Accounts. 
SELECT
    c.name,
    a.account_id,
    a.account_type,
    a.balance
FROM Customers c
INNER JOIN Accounts a
    ON c.customer_id = a.customer_id;


-- Query 17: Display customer name, transaction ID, amount, and  transaction type using Customers, Accounts, and Transactions.
SELECT
    c.name,
    t.transaction_id,
    t.amount,
    t.type
FROM Customers c
INNER JOIN Accounts a
    ON c.customer_id = a.customer_id
INNER JOIN Transactions t
    ON a.account_id = t.account_id;


-- Query 18: Display customer name, loan type, loan amount, and interest rate using Customers and Loans.
SELECT
    c.name,
    l.loan_type,
    l.amount,
    l.interest_rate
FROM Customers c
INNER JOIN Loans l
    ON c.customer_id = l.customer_id;


-- Query 19: Display employee name, designation, branch name, and location using Employees and Branches.
SELECT
    e.name,
    e.designation,
    b.branch_name,
    b.location
FROM Employees e
INNER JOIN Branches b
    ON e.branch_id = b.branch_id;


-- Query 20: Display names of customers whose account balance
-- is greater than the average balance of all accounts.
SELECT DISTINCT c.name
FROM Customers c
INNER JOIN Accounts a
    ON c.customer_id = a.customer_id
WHERE a.balance > (
    SELECT AVG(balance)
    FROM Accounts
);

USE banking_system;

SELECT COUNT(*) AS total_accounts
FROM Accounts;

SELECT *
FROM Accounts
ORDER BY account_id;















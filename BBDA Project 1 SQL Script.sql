CREATE DATABASE IndianBankingTransactionSystem;
USE IndianBankingTransactionSystem;

-- Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    AadhaarNo VARCHAR(12) UNIQUE,
    PAN VARCHAR(10) UNIQUE,
    Name VARCHAR(100),
    Address VARCHAR(200),
    DateOfBirth DATE,
    MobileNumber VARCHAR(10),
    EmailID VARCHAR(100)
);

-- Branch Table
CREATE TABLE Branch (
    IFSC VARCHAR(11) PRIMARY KEY,
    BranchName VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    PhoneNumber VARCHAR(15)
);

-- Account Table
CREATE TABLE Account (
    AccountNumber VARCHAR(16) PRIMARY KEY,
    CustomerID INT,
    IFSC VARCHAR(11),
    AccountType ENUM('Savings', 'Current', 'Fixed Deposit', 'Recurring Deposit'),
    Balance DECIMAL(15,2),
    OpenDate DATE,
    Status ENUM('Active', 'Dormant', 'Closed'),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (IFSC) REFERENCES Branch(IFSC)
);

-- Transaction Table
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY,
    AccountNumber VARCHAR(16),
    TransactionType ENUM('Deposit', 'Withdrawal', 'NEFT', 'RTGS', 'UPI', 'IMPS'),
    Amount DECIMAL(15,2),
    TransactionDate DATETIME,
    FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber)
);

-- Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    IFSC VARCHAR(11),
    Name VARCHAR(100),
    Position VARCHAR(50),
    AadhaarNumber VARCHAR(12) UNIQUE,
    PAN VARCHAR(10) UNIQUE,
    HireDate DATE,
    Salary DECIMAL(10,2),
    FOREIGN KEY (IFSC) REFERENCES Branch(IFSC)
);

-- Loan Table
CREATE TABLE Loan (
    LoanAccountNumber VARCHAR(16) PRIMARY KEY,
    CustomerID INT,
    IFSC VARCHAR(11),
    LoanType ENUM('Personal', 'Home', 'Vehicle', 'Education', 'Business'),
    Principal DECIMAL(15,2),
    InterestRate DECIMAL(5,2),
    Tenure INT,
    StartDate DATE,
    EndDate DATE,
    Status ENUM('Pending', 'Approved', 'Rejected', 'Active', 'Closed'),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (IFSC) REFERENCES Branch(IFSC)
);

-- DebitCard Table
CREATE TABLE DebitCard (
    CardNumber VARCHAR(16) PRIMARY KEY,
    AccountNumber VARCHAR(16),
    ExpirationDate DATE,
    CVV VARCHAR(3),
    PIN VARCHAR(4),
    Status ENUM('Active', 'Blocked', 'Expired'),
    FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber)
);

-- FixedDeposit Table
CREATE TABLE FixedDeposit (
    FDID INT PRIMARY KEY,
    AccountNumber VARCHAR(16),
    Amount DECIMAL(15,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    MaturityDate DATE,
    Tenure INT,
    FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber)
);

-- Insert dummy data into Customer table
INSERT INTO Customer (CustomerID, AadhaarNo, PAN, Name, Address, DateOfBirth, MobileNumber, EmailID) VALUES
(1, '123456789012', 'ABCDE1234F', 'Rajesh Kumar', '123 MG Road, Bangalore', '1985-05-15', '9876543210', 'rajesh@email.com'),
(2, '234567890123', 'BCDEF2345G', 'Priya Singh', '456 Anna Salai, Chennai', '1990-08-22', '8765432109', 'priya@email.com'),
(3, '345678901234', 'CDEFG3456H', 'Amit Patel', '789 SV Road, Mumbai', '1982-03-10', '7654321098', 'amit@email.com'),
(4, '456789012345', 'DEFGH4567I', 'Sunita Sharma', '101 Park Street, Kolkata', '1988-11-30', '6543210987', 'sunita@email.com'),
(5, '567890123456', 'EFGHI5678J', 'Vikram Reddy', '202 Jubilee Hills, Hyderabad', '1992-07-05', '5432109876', 'vikram@email.com'),
(6, '678901234567', 'FGHIJ6789K', 'Neha Gupta', '303 Civil Lines, Delhi', '1987-09-18', '4321098765', 'neha@email.com'),
(7, '789012345678', 'GHIJK7890L', 'Sanjay Desai', '404 FC Road, Pune', '1983-01-25', '3210987654', 'sanjay@email.com'),
(8, '890123456789', 'HIJKL8901M', 'Anita Nair', '505 MG Marg, Kochi', '1995-04-12', '2109876543', 'anita@email.com'),
(9, '901234567890', 'IJKLM9012N', 'Rahul Verma', '606 Gandhi Road, Jaipur', '1980-12-08', '1098765432', 'rahul@email.com'),
(10, '012345678901', 'JKLMN0123O', 'Meera Iyer', '707 100 Feet Road, Coimbatore', '1993-06-20', '9876543211', 'meera@email.com'),
(11, '123456789013', 'KLMNO1234P', 'Arjun Nair', '808 Nehru Place, New Delhi', '1986-02-14', '8765432100', 'arjun@email.com'),
(12, '234567890124', 'LMNOP2345Q', 'Pooja Mehta', '909 Relief Road, Ahmedabad', '1991-10-03', '7654321099', 'pooja@email.com'),
(13, '345678901235', 'MNOPQ3456R', 'Karthik Raman', '111 Nungambakkam, Chennai', '1984-08-17', '6543210988', 'karthik@email.com'),
(14, '456789012346', 'NOPQR4567S', 'Anjali Menon', '222 MG Road, Trivandrum', '1989-12-29', '5432109877', 'anjali@email.com'),
(15, '567890123457', 'OPQRS5678T', 'Vivek Joshi', '333 Koramangala, Bangalore', '1994-03-07', '4321098766', 'vivek@email.com'),
(16, '678901234568', 'PQRST6789U', 'Deepa Sinha', '444 Salt Lake, Kolkata', '1981-05-23', '3210987655', 'deepa@email.com'),
(17, '789012345679', 'QRSTU7890V', 'Rohit Kapoor', '555 Banjara Hills, Hyderabad', '1996-01-09', '2109876544', 'rohit@email.com'),
(18, '890123456780', 'RSTUV8901W', 'Shreya Gopal', '666 Indiranagar, Bangalore', '1987-07-31', '1098765433', 'shreya@email.com'),
(19, '901234567891', 'STUVW9012X', 'Arun Krishnan', '777 Adyar, Chennai', '1992-09-26', '9876543212', 'arun@email.com'),
(20, '012345678902', 'TUVWX0123Y', 'Kavita Rao', '888 Vashi, Navi Mumbai', '1985-11-11', '8765432101', 'kavita@email.com');

-- Insert dummy data into Branch table
INSERT INTO Branch (IFSC, BranchName, Address, City, State, PhoneNumber) VALUES
('SBIN0000001', 'State Bank of India, Main Branch', '11 Parliament Street', 'New Delhi', 'Delhi', '01123745671'),
('HDFC0000001', 'HDFC Bank, Nariman Point', '1 HDFC Bank House', 'Mumbai', 'Maharashtra', '02266316000'),
('ICIC0000001', 'ICICI Bank, Cenotaph Road', '1 Cenotaph Road', 'Chennai', 'Tamil Nadu', '04466070000'),
('AXIB0000001', 'Axis Bank, MG Road', '1 MG Road', 'Bangalore', 'Karnataka', '08025580333'),
('PUNB0000001', 'Punjab National Bank, Connaught Place', '7 Bhikaji Cama Place', 'New Delhi', 'Delhi', '01126102303'),
('UTIB0000001', 'UTI Bank, Chowringhee', '1 Shakespeare Sarani', 'Kolkata', 'West Bengal', '03339550000'),
('BARB0000001', 'Bank of Baroda, Surat Main', '1 Udhna Darwaja', 'Surat', 'Gujarat', '02612363100'),
('BKID0000001', 'Bank of India, Bandra', '1 Bandra East', 'Mumbai', 'Maharashtra', '02226572555'),
('IDIB0000001', 'Indian Bank, Anna Salai', '1 Anna Salai', 'Chennai', 'Tamil Nadu', '04428889999'),
('CNRB0000001', 'Canara Bank, Cunningham Road', '1 Cunningham Road', 'Bangalore', 'Karnataka', '08022266837'),
('SBIN0000002', 'State Bank of India, Colaba', '1 Shahid Bhagat Singh Road', 'Mumbai', 'Maharashtra', '02222870745'),
('HDFC0000002', 'HDFC Bank, Vasant Vihar', '1 Paschimi Marg', 'New Delhi', 'Delhi', '01146323909'),
('ICIC0000002', 'ICICI Bank, Banjara Hills', '1 Road No. 1', 'Hyderabad', 'Telangana', '04023356722'),
('AXIB0000002', 'Axis Bank, Salt Lake', '1 Sector V', 'Kolkata', 'West Bengal', '03323580601'),
('PUNB0000002', 'Punjab National Bank, Ludhiana Main', '1 Bharat Nagar Chowk', 'Ludhiana', 'Punjab', '01612773111'),
('UTIB0000002', 'UTI Bank, Ashram Road', '1 Ashram Road', 'Ahmedabad', 'Gujarat', '07926580804'),
('BARB0000002', 'Bank of Baroda, Connaught Place', '1 Sansad Marg', 'New Delhi', 'Delhi', '01123714935'),
('BKID0000002', 'Bank of India, T Nagar', '1 North Usman Road', 'Chennai', 'Tamil Nadu', '04424330233'),
('IDIB0000002', 'Indian Bank, Saket', '1 Saket District Centre', 'New Delhi', 'Delhi', '01126852257'),
('CNRB0000002', 'Canara Bank, Jubilee Hills', '1 Road No. 36', 'Hyderabad', 'Telangana', '04023545555');

-- Insert dummy data into Account table
INSERT INTO Account (AccountNumber, CustomerID, IFSC, AccountType, Balance, OpenDate, Status) VALUES
('1234567890123456', 1, 'SBIN0000001', 'Savings', 50000.00, '2020-01-15', 'Active'),
('2345678901234567', 2, 'HDFC0000001', 'Current', 100000.00, '2019-05-22', 'Active'),
('3456789012345678', 3, 'ICIC0000001', 'Savings', 75000.00, '2021-03-10', 'Active'),
('4567890123456789', 4, 'AXIB0000001', 'Savings', 25000.00, '2018-11-30', 'Active'),
('5678901234567890', 5, 'PUNB0000001', 'Current', 200000.00, '2020-07-05', 'Active'),
('6789012345678901', 6, 'UTIB0000001', 'Savings', 30000.00, '2019-09-18', 'Active'),
('7890123456789012', 7, 'BARB0000001', 'Savings', 40000.00, '2021-01-25', 'Active'),
('8901234567890123', 8, 'BKID0000001', 'Current', 150000.00, '2020-04-12', 'Active'),
('9012345678901234', 9, 'IDIB0000001', 'Savings', 60000.00, '2018-12-08', 'Active'),
('0123456789012345', 10, 'CNRB0000001', 'Savings', 35000.00, '2021-06-20', 'Active'),
('1234567890123457', 11, 'SBIN0000002', 'Current', 80000.00, '2019-02-14', 'Active'),
('2345678901234568', 12, 'HDFC0000002', 'Savings', 45000.00, '2020-10-03', 'Active'),
('3456789012345679', 13, 'ICIC0000002', 'Savings', 55000.00, '2018-08-17', 'Active'),
('4567890123456780', 14, 'AXIB0000002', 'Current', 120000.00, '2021-12-29', 'Active'),
('5678901234567891', 15, 'PUNB0000002', 'Savings', 70000.00, '2020-03-07', 'Active'),
('6789012345678902', 16, 'UTIB0000002', 'Savings', 25000.00, '2019-05-23', 'Dormant'),
('7890123456789013', 17, 'BARB0000002', 'Current', 90000.00, '2021-01-09', 'Active'),
('8901234567890124', 18, 'BKID0000002', 'Savings', 40000.00, '2020-07-31', 'Active'),
('9012345678901235', 19, 'IDIB0000002', 'Savings', 65000.00, '2019-09-26', 'Active'),
('0123456789012346', 20, 'CNRB0000002', 'Current', 110000.00, '2021-11-11', 'Active');

-- Insert dummy data into Transaction table
INSERT INTO Transaction (TransactionID, AccountNumber, TransactionType, Amount, TransactionDate) VALUES
(1, '1234567890123456', 'Deposit', 5000.00, '2023-01-15 10:30:00'),
(2, '2345678901234567', 'Withdrawal', 2000.00, '2023-01-16 14:45:00'),
(3, '3456789012345678', 'NEFT', 10000.00, '2023-01-17 09:15:00'),
(4, '4567890123456789', 'UPI', 500.00, '2023-01-18 18:20:00'),
(5, '5678901234567890', 'RTGS', 50000.00, '2023-01-19 11:00:00'),
(6, '6789012345678901', 'Deposit', 3000.00, '2023-01-20 16:30:00'),
(7, '7890123456789012', 'Withdrawal', 1000.00, '2023-01-21 13:45:00'),
(8, '8901234567890123', 'IMPS', 5000.00, '2023-01-22 10:00:00'),
(9, '9012345678901234', 'UPI', 200.00, '2023-01-23 19:30:00'),
(10, '0123456789012345', 'Deposit', 2000.00, '2023-01-24 12:15:00'),
(11, '1234567890123457', 'NEFT', 15000.00, '2023-01-25 09:45:00'),
(12, '2345678901234568', 'Withdrawal', 3000.00, '2023-01-26 17:00:00'),
(13, '3456789012345679', 'UPI', 1000.00, '2023-01-27 20:30:00'),
(14, '4567890123456780', 'RTGS', 100000.00, '2023-01-28 11:30:00'),
(15, '5678901234567891', 'Deposit', 4000.00, '2023-01-29 15:45:00'),
(16, '6789012345678902', 'IMPS', 2000.00, '2023-01-30 08:00:00'),
(17, '7890123456789013', 'Withdrawal', 5000.00, '2023-01-31 14:30:00'),
(18, '8901234567890124', 'UPI', 300.00, '2023-02-01 19:00:00'),
(19, '9012345678901235', 'NEFT', 7000.00, '2023-02-02 10:45:00'),
(20, '0123456789012346', 'Deposit', 10000.00, '2023-02-03 16:15:00');

-- Insert dummy data into Employee table
INSERT INTO Employee (EmployeeID, IFSC, Name, Position, AadhaarNumber, PAN, HireDate, Salary) VALUES
(1, 'SBIN0000001', 'Amit Sharma', 'Branch Manager', '111122223333', 'ABCD1234E', '2015-06-01', 120000.00),
(2, 'HDFC0000001', 'Sneha Patel', 'Assistant Manager', '444455556666', 'EFGH5678I', '2017-08-15', 90000.00),
(3, 'ICIC0000001', 'Rajiv Menon', 'Clerk', '777788889999', 'IJKL9012M', '2018-10-10', 60000.00),
(4, 'AXIB0000001', 'Priya Rao', 'Relationship Manager', '222233334444', 'LMNO3456N', '2016-03-23', 105000.00),
(5, 'PUNB0000001', 'Manoj Verma', 'Teller', '555566667777', 'NOPQ7890O', '2019-11-11', 50000.00),
(6, 'UTIB0000001', 'Nisha Kumar', 'Branch Manager', '888899990000', 'QRST1234P', '2014-12-01', 130000.00),
(7, 'BARB0000001', 'Kiran Gupta', 'Assistant Manager', '333344445555', 'RSTM5678Q', '2020-07-15', 95000.00),
(8, 'BKID0000001', 'Deepak Yadav', 'Clerk', '666677778888', 'UVWX9012R', '2018-09-20', 62000.00),
(9, 'IDIB0000001', 'Neelam Sinha', 'Relationship Manager', '999900001111', 'YZAB3456S', '2017-04-15', 110000.00),
(10, 'CNRB0000001', 'Ravi Kumar', 'Teller', '000011112222', 'CDEF7890T', '2016-11-25', 52000.00),
(11, 'SBIN0000002', 'Anita Sharma', 'Branch Manager', '123456789012', 'GHIJ1234U', '2015-07-30', 125000.00),
(12, 'HDFC0000002', 'Sandeep Mehta', 'Assistant Manager', '234567890123', 'JKLM5678V', '2018-05-16', 91000.00),
(13, 'ICIC0000002', 'Sunil Kumar', 'Clerk', '345678901234', 'NOPQ9012W', '2019-09-10', 63000.00),
(14, 'AXIB0000002', 'Divya Rao', 'Relationship Manager', '456789012345', 'QRST1234X', '2017-10-10', 107000.00),
(15, 'PUNB0000002', 'Rajesh Mehta', 'Teller', '567890123456', 'UVWX5678Y', '2018-06-15', 54000.00),
(16, 'UTIB0000002', 'Manisha Singh', 'Branch Manager', '678901234567', 'YZAB9012Z', '2013-08-01', 135000.00),
(17, 'BARB0000002', 'Vikram Yadav', 'Assistant Manager', '789012345678', 'CDEF1234A', '2019-12-15', 96000.00),
(18, 'BKID0000002', 'Swati Sharma', 'Clerk', '890123456789', 'GHIJ5678B', '2020-03-20', 64000.00),
(19, 'IDIB0000002', 'Kavita Patel', 'Relationship Manager', '901234567890', 'JKLM9012C', '2016-11-25', 112000.00),
(20, 'CNRB0000002', 'Ravi Shankar', 'Teller', '012345678901', 'NOPQ3456D', '2015-06-01', 55000.00);

-- Insert dummy data into Loan table
INSERT INTO Loan (LoanAccountNumber, CustomerID, IFSC, LoanType, Principal, InterestRate, Tenure, StartDate, EndDate, Status) VALUES
('LN0000000001', 1, 'SBIN0000001', 'Home', 500000.00, 7.50, 240, '2022-01-01', '2042-01-01', 'Approved'),
('LN0000000002', 2, 'HDFC0000001', 'Vehicle', 200000.00, 8.00, 60, '2023-03-15', '2028-03-15', 'Approved'),
('LN0000000003', 3, 'ICIC0000001', 'Personal', 100000.00, 9.00, 36, '2023-02-20', '2026-02-20', 'Active'),
('LN0000000004', 4, 'AXIB0000001', 'Education', 300000.00, 6.00, 120, '2021-06-10', '2031-06-10', 'Approved'),
('LN0000000005', 5, 'PUNB0000001', 'Home', 1000000.00, 7.25, 240, '2020-05-01', '2040-05-01', 'Active'),
('LN0000000006', 6, 'UTIB0000001', 'Vehicle', 150000.00, 8.50, 60, '2022-08-05', '2027-08-05', 'Closed'),
('LN0000000007', 7, 'BARB0000001', 'Personal', 50000.00, 10.00, 24, '2023-01-10', '2025-01-10', 'Approved'),
('LN0000000008', 8, 'BKID0000001', 'Education', 200000.00, 6.75, 120, '2021-07-20', '2031-07-20', 'Active'),
('LN0000000009', 9, 'IDIB0000001', 'Business', 500000.00, 7.00, 180, '2020-09-15', '2030-09-15', 'Approved'),
('LN0000000010', 10, 'CNRB0000001', 'Home', 400000.00, 7.50, 180, '2021-12-01', '2031-12-01', 'Approved'),
('LN0000000011', 11, 'SBIN0000002', 'Vehicle', 300000.00, 8.00, 60, '2022-04-01', '2027-04-01', 'Active'),
('LN0000000012', 12, 'HDFC0000002', 'Personal', 150000.00, 9.50, 36, '2022-11-01', '2025-11-01', 'Approved'),
('LN0000000013', 13, 'ICIC0000002', 'Education', 250000.00, 6.25, 120, '2021-05-01', '2031-05-01', 'Approved'),
('LN0000000014', 14, 'AXIB0000002', 'Business', 700000.00, 7.75, 180, '2022-01-01', '2032-01-01', 'Active'),
('LN0000000015', 15, 'PUNB0000002', 'Home', 600000.00, 7.50, 240, '2022-09-01', '2042-09-01', 'Approved'),
('LN0000000016', 16, 'UTIB0000002', 'Vehicle', 250000.00, 8.25, 60, '2023-03-01', '2028-03-01', 'Active'),
('LN0000000017', 17, 'BARB0000002', 'Personal', 80000.00, 9.00, 24, '2022-06-01', '2024-06-01', 'Approved'),
('LN0000000018', 18, 'BKID0000002', 'Education', 350000.00, 6.50, 120, '2021-08-01', '2031-08-01', 'Approved'),
('LN0000000019', 19, 'IDIB0000002', 'Business', 400000.00, 7.25, 180, '2022-02-15', '2032-02-15', 'Active'),
('LN0000000020', 20, 'CNRB0000002', 'Home', 500000.00, 7.75, 240, '2022-10-01', '2042-10-01', 'Approved');

-- Insert dummy data into DebitCard table
INSERT INTO DebitCard (CardNumber, AccountNumber, ExpirationDate, CVV, PIN, Status) VALUES
('1234567812345678', '1234567890123456', '2026-01-01', '123', '1234', 'Active'),
('2345678923456789', '2345678901234567', '2026-03-01', '234', '2345', 'Active'),
('3456789034567890', '3456789012345678', '2025-05-01', '345', '3456', 'Active'),
('4567890145678901', '4567890123456789', '2024-07-01', '456', '4567', 'Active'),
('5678901256789012', '5678901234567890', '2025-09-01', '567', '5678', 'Active'),
('6789012367890123', '6789012345678901', '2026-11-01', '678', '6789', 'Blocked'),
('7890123478901234', '7890123456789012', '2024-12-01', '789', '7890', 'Expired'),
('8901234589012345', '8901234567890123', '2025-04-01', '890', '8901', 'Active'),
('9012345690123456', '9012345678901234', '2026-07-01', '901', '9012', 'Active'),
('0123456701234567', '0123456789012345', '2024-10-01', '012', '0123', 'Active'),
('1234567812345679', '1234567890123457', '2026-02-01', '123', '1234', 'Active'),
('2345678923456790', '2345678901234568', '2025-06-01', '234', '2345', 'Blocked'),
('3456789034567801', '3456789012345679', '2026-08-01', '345', '3456', 'Active'),
('4567890145678912', '4567890123456780', '2024-05-01', '456', '4567', 'Expired'),
('5678901256789023', '5678901234567891', '2025-11-01', '567', '5678', 'Active'),
('6789012367890134', '6789012345678902', '2024-12-01', '678', '6789', 'Active'),
('7890123478901245', '7890123456789013', '2025-10-01', '789', '7890', 'Blocked'),
('8901234589012356', '8901234567890124', '2026-04-01', '890', '8901', 'Active'),
('9012345690123467', '9012345678901235', '2025-12-01', '901', '9012', 'Expired'),
('0123456701234578', '0123456789012346', '2024-06-01', '012', '0123', 'Active');

-- Insert dummy data into FixedDeposit table
INSERT INTO FixedDeposit (FDID, AccountNumber, Amount, InterestRate, StartDate, MaturityDate, Tenure) VALUES
(1, '1234567890123456', 10000.00, 5.00, '2023-01-01', '2024-01-01', 12),
(2, '2345678901234567', 15000.00, 5.50, '2023-02-01', '2025-02-01', 24),
(3, '3456789012345678', 20000.00, 6.00, '2023-03-01', '2026-03-01', 36),
(4, '4567890123456789', 25000.00, 6.25, '2023-04-01', '2026-04-01', 36),
(5, '5678901234567890', 30000.00, 6.50, '2023-05-01', '2027-05-01', 48),
(6, '6789012345678901', 35000.00, 6.75, '2023-06-01', '2028-06-01', 60),
(7, '7890123456789012', 40000.00, 7.00, '2023-07-01', '2028-07-01', 60),
(8, '8901234567890123', 45000.00, 7.25, '2023-08-01', '2029-08-01', 72),
(9, '9012345678901234', 50000.00, 7.50, '2023-09-01', '2029-09-01', 72),
(10, '0123456789012345', 55000.00, 7.75, '2023-10-01', '2030-10-01', 84),
(11, '1234567890123457', 60000.00, 8.00, '2023-11-01', '2030-11-01', 84),
(12, '2345678901234568', 65000.00, 8.25, '2023-12-01', '2031-12-01', 96),
(13, '3456789012345679', 70000.00, 8.50, '2024-01-01', '2031-01-01', 96),
(14, '4567890123456780', 75000.00, 8.75, '2024-02-01', '2032-02-01', 108),
(15, '5678901234567891', 80000.00, 9.00, '2024-03-01', '2032-03-01', 108),
(16, '6789012345678902', 85000.00, 9.25, '2024-04-01', '2033-04-01', 120),
(17, '7890123456789013', 90000.00, 9.50, '2024-05-01', '2033-05-01', 120),
(18, '8901234567890124', 95000.00, 9.75, '2024-06-01', '2034-06-01', 132),
(19, '9012345678901235', 100000.00, 10.00, '2024-07-01', '2034-07-01', 132),
(20, '0123456789012346', 105000.00, 10.25, '2024-08-01', '2035-08-01', 144);

SHOW tables;
SELECT * FROM account

SHOW tables;
SELECT * FROM branch

SHOW tables;
SELECT * FROM customer

SHOW tables;
SELECT * FROM debitcard

SHOW tables;
SELECT * FROM employee

SHOW tables;
SELECT * FROM fixeddeposit

SHOW tables;
SELECT * FROM loan

SHOW tables;
SELECT * FROM transaction

INSERT INTO Customer (CustomerID, AadhaarNo, PAN, Name, Address, DateOfBirth, MobileNumber, EmailID) 
VALUES 
(21, '123456789021', 'ABCDE5678X', 'Sita Rao', '123 Elm Street, Pune', '1990-04-20', '9876543213', 'sita@email.com');

INSERT INTO Branch (IFSC, BranchName, Address, City, State, PhoneNumber) 
VALUES 
('HDFC0000003', 'HDFC Bank, Vashi', '2 Vashi Road', 'Navi Mumbai', 'Maharashtra', '02266554433');

INSERT INTO Branch (IFSC, BranchName, Address, City, State, PhoneNumber) 
VALUES 
('HDFC0000007', 'HDFC Bank, Vashi', '2 Vashi Road', 'Navi Mumbai', 'Maharashtra', '02266554433');

INSERT INTO Transaction (TransactionID, AccountNumber, TransactionType, Amount, TransactionDate) 
VALUES 
(21, '1234567890123457', 'Deposit', 10000.00, '2024-02-01 09:00:00');

INSERT INTO Employee (EmployeeID, IFSC, Name, Position, AadhaarNumber, PAN, HireDate, Salary) 
VALUES 
(21, 'HDFC0000003', 'Rajiv Sharma', 'Manager', '123456789022', 'BCDEF5678Y', '2024-01-01', 50000.00);

INSERT INTO Loan (LoanAccountNumber, CustomerID, IFSC, LoanType, Principal, InterestRate, Tenure, StartDate, EndDate, Status) 
VALUES 
('LOAN1234567890', 21, 'HDFC0000003', 'Personal', 150000.00, 10.50, 24, '2024-01-01', '2025-01-01', 'Approved');

INSERT INTO DebitCard (CardNumber, AccountNumber, ExpirationDate, CVV, PIN, Status) 
VALUES 
('1234567890123458', '1234567890123457', '2027-01-01', '123', '0000', 'Active');

INSERT INTO FixedDeposit (FDID, AccountNumber, Amount, InterestRate, StartDate, MaturityDate, Tenure) 
VALUES 
(21, '1234567890123457', 20000.00, 6.00, '2024-01-01', '2026-01-01', 24);

SELECT * FROM Customer;

SELECT BranchName, City, PhoneNumber FROM Branch;

SELECT * FROM Account WHERE Balance > 50000;

SELECT c.Name, a.AccountNumber, a.Balance 
FROM Customer c
JOIN Account a ON c.CustomerID = a.CustomerID;

UPDATE Customer 
SET Address = '456 New Address, Pune', MobileNumber = '9876543214'
WHERE CustomerID = 21;

UPDATE Account 
SET Balance = Balance + 5000.00 
WHERE AccountNumber = '1234567890123457';

UPDATE Loan 
SET Status = 'Closed' 
WHERE LoanAccountNumber = 'LOAN1234567890';

DELETE FROM Customer 
WHERE CustomerID = 21;

DELETE FROM Account 
WHERE Balance < 30000;

DELETE FROM Transaction 
WHERE TransactionID = 21;


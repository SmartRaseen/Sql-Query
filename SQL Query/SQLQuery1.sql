
USE EmployeeData;

SELECT * FROM EMPLOYEE;

CREATE TABLE Employee(
 JobID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
 Jobtitle VARCHAR (100) NOT NULL,
 Employer VARCHAR (100) NOT NULL,
 Description VARCHAR (150) NOT NULL,
 EmpHistoryID INT NOT NULL,
);

CREATE TABLE Employment_Histroy(
EmpHistoryID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
EmpFrom VARCHAR (100) NOT NULL,
EmpTo VARCHAR (100) NOT NULL
);

ALTER TABLE Employee
ADD FOREIGN KEY (EmpHistoryID)
REFERENCES Employment_Histroy(EmpHistoryID)

select * from Employee;

select * from Employment_Histroy


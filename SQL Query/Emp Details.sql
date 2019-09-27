USE EMPLOYEEDATA;

--Rename DATABASE--

ALTER DATABASE EMPLOYEEDATA MODIFY NAME = RSN ;


SELECT * FROM EMPLOYEE;

SELECT * FROM Employment_History;

CREATE TABLE Employment_History(
EmpHistoryID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
EmpFrom VARCHAR (100) NOT NULL,
EmpTo VARCHAR (100) NOT NULL
);

CREATE TABLE Employee(
 JobID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
 Jobtitle VARCHAR (100) NOT NULL,
 Employer VARCHAR (100) NOT NULL,
 Description VARCHAR (150) NOT NULL,
 EmpHistoryID INT NOT NULL,
);

ALTER TABLE Employee
ADD FOREIGN KEY (EmpHistoryID)
REFERENCES Employment_History(EmpHistoryID)


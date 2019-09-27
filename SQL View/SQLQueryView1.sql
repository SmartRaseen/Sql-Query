USE USERVIEW;

SELECT * FROM EMPLOYEE_DETAILS;

SELECT * FROM Employee_Contact;

SELECT * FROM EMPLOYEE_VIEW4;

Sp_HelpText Employee_View4;

SELECT * FROM EMPLOYEE_VIEW1;

ALTER VIEW EMPLOYEE_VIEW1
AS
SELECT EMP_ID,EMP_NAME,EMP_SALARY FROM Employee_Details;

DROP TABLE [dbo].[Employee_Demo];

CREATE TABLE [dbo].[Employee_Demo]
(
	[Emp_ID] [int] Not Null, 
	[Name] [nvarchar](50) Not Null,
	[City] [nvarchar](50) Not Null
) ON[PRIMARY]

SELECT * FROM Employee_Demo;

INSERT INTO Employee_Demo VALUES(1,'Raseen','Nagore'),
(2,'Kader','Kuala Lumpur'),
(3,'Sithi','Saudi'),
(4,'Ayisha','Mumbai'),
(5,'Geetha','Bangalore');

CREATE VIEW DEMO_VIEW
AS
SELECT * FROM Employee_Demo;

SELECT * FROM Employee_Demo;

SELECT * FROM DEMO_VIEW;

ALTER TABLE Employee_Demo
ADD Gender [nvarchar](15) Null;

Exec sp_refreshview DEMO_VIEW;

SELECT * FROM DEMO_VIEW1;

CREATE VIEW DEMO_VIEW1 
WITH SCHEMABINDING
AS
SELECT Emp_ID,Name,City,Gender FROM DBO.Employee_Demo;

CREATE VIEW ENCRYPTED_VIEW
WITH ENCRYPTION
AS
SELECT Emp_ID,Name,City,Gender FROM DBO.Employee_Demo;

Sp_HelpText 'ENCRYPTED_VIEW';




CREATE DATABASE UserDefinedType;

USE UserDefinedType;

-- Creating DataType 
-- *****************

CREATE TYPE TYPENAME FROM VARCHAR(25)
CREATE TYPE TYPEAGE FROM INT
CREATE TYPE TYPELOCATION FROM VARCHAR(100)
CREATE TYPE TYPEGENDER FROM VARCHAR(15)

CREATE TABLE EMP(EMP_NAME TYPENAME,EMP_AGE TYPEAGE,EMP_GENDER TYPEGENDER,EMP_LOCATION TYPELOCATION);

INSERT INTO EMP VALUES('Raseen',21,'Male','Nagore'),
('Misriya',28,'Female','Nagore'),
('Kader',32,'Male','Nagore'),
('Hameed',22,'Male','Bangalore'),
('Sulthan',25,'Male','Mumbai'),
('Ayisha',18,'Female','Nagore'),
('Geetha',21,'Female','Bangalore');

SELECT * FROM EMP;

DROP TABLE EMP;

------------------------------------------------------------------------------------------

--Creating Table type  
  
CREATE TYPE empTempTabletype AS Table (ID int identity(1,1),name varchar(100) default('raseen'), age int, location VARCHAR(100))    
  
--Creating temp table of above type  
  
DECLARE @emp empTempTableType    
INSERT INTO @emp(age, location) VALUES(22, 'Nagore'), (25, 'Chennai')    
SELECT * FROM @emp  

-------------------------------------------------------------

--Creating Table type  
  
CREATE TYPE EmployeeTempTableType AS Table (ID int identity(1,1),name varchar(100), age int, location VARCHAR(100))    
  
--Creating temp table of above type  
  
DECLARE @EmpTableType EmployeeTempTableType    
INSERT INTO @EmpTableType(name,age,location) VALUES('Raseen', 23, 'Chennai'),    
('Kira', 30, 'Hyderabad');    
SELECT * FROM @EmpTableType 

--------------------------------------------------------------
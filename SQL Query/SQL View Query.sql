		Views In SQL SERVER
		*******************

	1.	Create Two Table With Primary And Foreign Key
		*********************************************

		CREATE TABLE [dbo].[Employee_Details](
		[Emp_ID] [int] IDENTITY(1,1) NOT NULL,
		[Emp_Name] [nvarchar](50) NOT NULL,
		[Emp_City] [nvarchar](50) NOT NULL,
		[Emp_Salary] [int] NOT NULL,

		CONSTRAINT [PK_Employee_Details] PRIMARY KEY CLUSTERED
		(
			[Emp_ID] ASC
		)

		WITH ( PAD_INDEX=OFF, STATISTICS_NORECOMPUTE=OFF, IGNORE_DUP_KEY=OFF, ALLOW_PAGE_LOCKS=ON, ALLOW_ROW_LOCKS=ON ) ON[PRIMARY]
		)
		ON [PRIMARY]
 
-------------------------------------------

		CREATE TABLE [dbo].[Employee_Contact]
		(
		[Emp_ID] [int] NOT NULL,
		[Mobile_No] [nvarchar](15) NOT NULL
		)
		ON [PRIMARY]	

		ALTER TABLE [dbo].[Employee_Contact]
		WITH CHECK ADD CONSTRAINT [FK_Employee_Contact_Employee_Details] FOREIGN KEY ([Emp_ID])
		REFERENCES [dbo].[Employee_Details] ([Emp_ID])

		ALTER TABLE [dbo].[Employee_Contact]
		CHECK CONSTRAINT [FK_Employee_Contact_Employee_Details]

----------------------------------------------------------------------------------------------------------------------------------------------

	2.	Inserting Data Into Employee_Details
		************************************
		
		INSERT INTO Employee_Details VALUES('Raseen','Chennai',25000),
		('Kader','Kuala Lumpur',50000),
		('Abdullah','Saudi',16000),
		('Mustaq','Bangalore',15000),
		('Geetha','Chennai',20000),
		('Ayisha','Dubai',22000);		


		INSERT INTO Employee_Contact VALUES(1,'9677863344'),
		(2,'6094383930'),
		(3,'6109231728'),
		(4,'8939463284'),
		(5,'9835929838'),
		(6,'9283892345');
 
-----------------------------------------------------------------------------------------------------------------------------------------------

	3.	Create Views
		************
		
	1.	CREATE VIEW EMPLOYEE_VIEW1 
		AS 
		SELECT * FROM Employee_Details;

	2.	CREATE VIEW EMPLOYEE_VIEW2
		AS
		SELECT EMP_ID,EMP_NAME,EMP_CITY FROM EMPLOYEE_DETAILS;
	
	3.	CREATE VIEW EMPLOYEE_VIEW3
		AS
		SELECT * FROM Employee_Details WHERE Emp_ID>3;

	4.	CREATE VIEW EMPLOYEE_VIEW4
		AS
		SELECT Employee_Details.Emp_ID,
		Employee_Details.Emp_Name,
		Employee_Details.Emp_Salary,
		Employee_Contact.Mobile_No
		FROM Employee_Details 
		LEFT OUTER JOIN 
		Employee_Contact ON EMPLOYEE_DETAILS.Emp_ID = Employee_Contact.Emp_ID WHERE EMPLOYEE_DETAILS.Emp_ID>2;
		
-----------------------------------------------------------------------------------------------------------------------------------------------

	4.	Select Create View
		******************

	1.	SELECT * FROM EMPLOYEE_VIEW1;
	
	2.	SELECT * FROM EMPLOYEE_VIEW2;
	
	3.	SELECT * FROM EMPLOYEE_VIEW3;
	
	4.	SELECT * FROM EMPLOYEE_VIEW4;

-----------------------------------------------------------------------------------------------------------------------------------------------

	5.	Drop Created View
		*****************
		
	1.	DROP VIEW EMPLOYEE_VIEW1;
	
	2.	DROP VIEW EMPLOYEE_VIEW2;
	
	3.	DROP VIEW EMPLOYEE_VIEW3;
	
	4.	DROP VIEW EMPLOYEE_VIEW4;
	
-----------------------------------------------------------------------------------------------------------------------------------------------

	6.	Renaming View
		*************
		
	*	Sp_Rename OldName, NewName
	
	*	Sp_Rename EMPLOYEE_VIEW1, EMPLOYEE_NewView1
	
-----------------------------------------------------------------------------------------------------------------------------------------------

	7.	Stored Procedures  Getting Information About VIEW
		***************** ********************************
		
	*	Sp_HelpText ViewName
	
	*	Sp_HelpText EMPLOYEE_VIEW1;
	
		EXAMPLE
		*******
		
		CREATE VIEW EMPLOYEE_VIEW1
		AS
		SELECT * FROM EMPLOYEE_DETAILS;
		
-----------------------------------------------------------------------------------------------------------------------------------------------

	8.	Alter view In Sql Server
		************************
		
	*	ALTER VIEW EMPLOYEE_DETAILS
		AS
		SELECT * FROM EMPLOYEE_DETAILS WHERE EMP_ID >3;
		
-----------------------------------------------------------------------------------------------------------------------------------------------

	9.	Refreshing View Sql Server
		**************************
		
	*	CREATE VIEW EMPLOYEE_VIEW1  
		AS  
		SELECT * FROM Employee_Details;  
  
		Now add a column in Employee_Details table.  
  
	*	ALTER TABLE Employee_Details 
		ADD MY_SAL [nvarchar](50);

		Changes only in the Table not in view, For removing this problem we use the system-defined Stored Procedure sp_refreshview.
		
	*	EXAMPLE
		*******
		
	*	Exec sp_refreshview VIEW NAME
		
	*	Exec sp_refreshview EMPLOYEE_VIEW1

	* 	Now SELECT * FROM EMPLOYEE_DETAILS;
	
	*	SELECT * FROM EMPLOYEE_VIEW1; Both Contains Same Records...
	
-----------------------------------------------------------------------------------------------------------------------------------------------

	10.	SchemaBinding a VIEW
		********************
	
	*	In the previous example, we saw that if we add a new column into the table then we must refresh the view.
 
	*	Such a way if we change the data type of any column in a table then we should refresh the view. 
		If we want to prevent any type of change in a base table then we can use the concept of SCHEMABINDING. 
		It will lock the tables being referred to by the view and restrict all kinds of changes that may change the table schema (no Alter command).
 
	*	We cannot specify "Select * from tablename" with the query. We need to specify all the column names for reference.
	
	*	EXAMPLE
		*******
	
	*	CREATE VIEW Employee_Details3  
		WITH SCHEMABINDING  
		AS  
		SELECT Emp_Id,Emp_Name,Emp_Salary,Emp_City from DBO.Employee_Details 
	
	*	In the preceding example, we create a view using Schemabinding. 
		Now we try to change the datatype of Emp_Salary from int to Decimal in the Base Table.
		
	* 	It will secure our datatype, nobody can change datatype in our table.
	
	*	We find that we cannot change the data type because we used the SCHEMABINDING that prevents any type of change in the base table.
	
-----------------------------------------------------------------------------------------------------------------------------------------------

	11.	Encrypt a view in SQL Server
		****************************
 
	*	The “WITH ENCRYPTION” option can encrypt any views. That means it will not be visible via SP_HELPTEXT. 
		
	*	This option encrypts the definition. This option encrypts the definition of the view. 
		
	*	Users will not be able to see the definition of the view after it is created. 
		
	*	This is the main advantage of the view where we can make it secure.

	*	EXAMPLE
		*******
		
	*	CREATE VIEW Employee_Details4  
		WITH ENCRYPTION  
		AS  
		SELECT Emp_Id,Emp_Name,Emp_Salary,Emp_City FROM DBO.Employee_Details  
		
	*	Now we try to retrieve the definition of the view.
		
	*	EXEC sp_helptext 'Employee_Details4'
	
	*	Output
		******
		
	*	The text for object 'Employee_Details4' is encrypted.
	
-----------------------------------------------------------------------------------------------------------------------------------------------
	
	12.	Check Option
		***** ******
	
	*	The use of the Check Option in a view is to ensure that all the Update and Insert commands must satisfy the condition in the view definition.
	
	*	EXAMPLE
		*******
		
	*	CREATE VIEW [dbo].[Employee_Details7]  
		AS  
		SELECT * FROM Employee_Details  
		WHERE Emp_Salary>30000

	*	In the preceding example, we create a view that contains all the data for which Emp_Salry > 30000 
		but we can insert the data for a salary less than 30000 as follows.

	*	Insert Into Employee_Details7 values ('ram','mumbai',25000,'Pan')  

	*	For preventing this problem we can use the Check Option property such as:  
  
	*	CREATE VIEW [dbo].[Employee_Details7]  
		AS  
		SELECT * FROM Employee_Details  
		WHERE Emp_Salary>30000   
		WITH CHECK OPTION 
		
	*	Now if we try to execute the preceding query then it will throw an error such as:

	*	Insert Into Employee_Details7 values ('ram','mumbai',25000,'Pan')  

	*	Output
 
		Msg 550, Level 16, State 1, Line 1
		The attempted insert or update failed because the target view either specifies WITH CHECK OPTION or spans a view 
		that specifies WITH CHECK OPTION and one or more rows resulting from the operation did not qualify under the CHECK OPTION constraint.
		The statement has been terminated.
 
-----------------------------------------------------------------------------------------------------------------------------------------------


 

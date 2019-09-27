	
	Creating a simple stored procedure
	**********************************
	
	The following SELECT statement returns a list of Bike from the Bike table in the (StoredProcedureData) database:

	1.	SELECT 
		Bike_Name, 
		Bike_Color
		FROM 
		Bike
		ORDER BY 
		Bike_Name;
	
-----------------------------------------------------------------------------------------------------------------------------------------------
	
	To create a stored procedure that wraps this query, you use the CREATE PROCEDURE statement as follows:
	
	2.	CREATE PROCEDURE BikeList
		AS
		BEGIN
		SELECT 
			Bike_Name, 
			Bike_Color
		FROM 
			Bike
		ORDER BY 
			Bike_Name;
		END;
		
		
		In this syntax:
		***************

	*	The BikeList is the name of the stored procedure.
	
	*	The AS keyword separates the heading and the body of the stored procedure.
	
	*	If the stored procedure has one statement, the BEGIN and END keywords surrounding the statement are optional. 
		However, it is a good practice to include them to make the code clear.

-----------------------------------------------------------------------------------------------------------------------------------------------
	
	3.	Executing a stored procedure
		****************************
	
	*	To execute a stored procedure, you use the EXECUTE or EXEC statement followed by the name of the stored procedure:
	
		EXECUTE sp_name;	(OR)	EXEC sp_name;
	
		EXAMPLE
		*******
		
		EXECUTE BikeList
		
		
	*	Where sp_name is the name of the stored procedure that you want to execute.

	*	For example, to execute the BikeList stored procedure, you use the following statement:

		EXECUTE BikeList.
		
-----------------------------------------------------------------------------------------------------------------------------------------------

	4.	Modifying a stored procedure
		****************************
	
	*	To modify an existing stored procedure, you use the ALTER PROCEDURE statement.
		
	*	ALTER PROCEDURE uspProductList
		AS
		BEGIN
			SELECT 
				Bike_Name, 
				Bike_Color
			FROM 
				Bike
			ORDER BY 
				Bike_Color 
		END;
		
	*	Then Execute The Command...
	
	*	EXECUTE BikeList.
	
-----------------------------------------------------------------------------------------------------------------------------------------------

	5.	Deleting a stored procedure
		***************************
		
	*	To delete a stored procedure, you use the DROP PROCEDURE or DROP PROC statement:
	
	*	DROP PROCEDURE sp_name;		(or)	DROP PROC sp_name;
	
	*	EXAMPLE
		*******
		
	*	DROP PROCEDURE BikeList;
		
-----------------------------------------------------------------------------------------------------------------------------------------------	
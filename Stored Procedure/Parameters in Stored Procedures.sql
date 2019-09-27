	
	Creating a stored procedure with one parameter
	**********************************************
	
	1.	You can create a stored procedure that wraps this query using the CREATE PROCEDURE statement:

	*	CREATE PROC BikeDetails
		AS
			BEGIN
				SELECT 
					Bike_Name,
					Bike_Price
				FROM 
					Bike
				ORDER BY 
					Bike_Name
			END;
			
		EXEC BikeDetails
			
--------------------------------------------------------------------------------------------------------------------------------------

	2.	However, this time we can add a parameter to the stored procedure to find the products 
		whose list prices are greater than an input price:
		
	*	ALTER PROC BikeDetails(@minimum_list_price AS DECIMAL)
		AS
			BEGIN
				SELECT 
					Bike_Name,
					Bike_Price
				FROM 
					Bike
				WHERE 
					Bike_Price >= @minimum_list_price
				ORDER BY 
					Bike_Price
			END;

		EXEC BikeDetails 10000;
		
--------------------------------------------------------------------------------------------------------------------------------------

	3.	Creating a stored procedure with multiple parameters
		****************************************************
		
	*	Stored procedures can take one or more parameters. The parameters are separated by commas.

	*	The following statement modifies the BikeDetails stored procedure by adding one more parameter named @maximum_list_price to it
	
	*	EXAMPLE
		*******
		
		ALTER PROC BikeDetails(@minimum_list_price AS DECIMAL,@maximum_list_price AS DECIMAL)	
		AS
			BEGIN
				SELECT 
					Bike_Name,
					Bike_Price
				FROM 
					Bike
				WHERE 
					Bike_Price >= @minimum_list_price AND
					Bike_Price <= @maximum_list_price
				ORDER BY 
					Bike_Price
			END;


	*	EXEC BikeDetails 70000,100000;
	
--------------------------------------------------------------------------------------------------------------------------------------
	
	4.	Using Named Parameters
		**********************
		
	*	In case stored procedures have multiple parameters, it is better and more clear to execute the stored procedures using named parameters.

	*	For example, the following statement executes the BikeDetails stored procedure using the named parameters 
	
	*	@minimum_list_price and @maximum_list_price:
	
	*	EXAMPLE
		*******
		
	*	EXECUTE BikeDetails 
		@minimum_list_price = 900, 
		@maximum_list_price = 1000;

	*	The result of the stored procedure is the same however the statement is more obvious.
	
--------------------------------------------------------------------------------------------------------------------------------------

	5.	Creating Text Parameter
		***********************
		
	*	The following statement adds the @name parameter as a character string parameter to the stored procedure.
	
	*	ALTER PROC BikeDetails(@minimum_list_price AS DECIMAL,
		@maximum_list_price AS DECIMAL,
		@name AS VARCHAR(max))
		AS
		BEGIN
			SELECT
				Bike_Name,
				Bike_Color,
				Bike_Price
			FROM
				Bike
			WHERE
				Bike_Price >= @minimum_list_price AND 
				Bike_Price <= @maximum_list_price AND
				Bike_Name LIKE '%' + @name + '%' 
			ORDER BY
				Bike_Price
		END;

	
	*	EXEC BikeDetails
		@minimum_list_price = 50000,
		@maximum_list_price = 150000,
		@name = 'Apache';
		
--------------------------------------------------------------------------------------------------------------------------------------

	6.	Creating optional parameters
		****************************
		
	*	When you execute the BikeDetails stored procedure, you must pass all three arguments corresponding to the three parameters.

	*	SQL Server allows you to specify default values for parameters so that when you call stored procedures, 
		you can skip the parameters with default values.

	*	ALTER PROCEDURE BikeDetails(
		@minimum_list_price AS DECIMAL = 0
		,@maximum_list_price AS DECIMAL = 999999
		,@name AS VARCHAR(max))
		AS
		BEGIN
			SELECT
				Bike_Name,
				Bike_Color,
				Bike_Price
			FROM 
				Bike
			WHERE
				Bike_Price >= @minimum_list_price AND
				Bike_Price <= @maximum_list_price AND
				Bike_Name LIKE '%' + @name + '%'
			ORDER BY
				Bike_Price;
		END;

		
	*	EXEC BikeDetails 
		@name = 'Pulser';
		
--------------------------------------------------------------------------------------------------------------------------------------

	7.	Using NULL as the default value
		*******************************
	
	*	In the uspFindProducts stored procedure, we used 999,999 as the default maximum list price. 
		This is not robust because in the future you may have products with the list prices that are greater than that.

	*	A typical technique to avoid this is to use NULL as the default value for the parameters:
	
	* 	ALTER PROCEDURE BikeDetails(
		@minimum_list_price AS DECIMAL = 0
		,@maximum_list_price AS DECIMAL = NULL
		,@name AS VARCHAR(max))
		AS
		BEGIN
			SELECT
				Bike_Name,
				Bike_Color,
				Bike_Price
			FROM 
				Bike
			WHERE
				Bike_Price >= @minimum_list_price AND
				(@maximum_list_price IS NULL OR Bike_Price <= @maximum_list_price) AND
				Bike_Name LIKE '%' + @name + '%'
			ORDER BY
				Bike_Price;
		END;

	*	EXEC BikeDetails
		@minimum_list_price = 50000,
		@name = 'a';

--------------------------------------------------------------------------------------------------------------------------------------


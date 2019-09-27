

		Variable
		********
	
	1.	What is a variable?
	
		*	A variable is an object that holds a single value of a specific type 
			e.g., integer, date, or varying character string.
	
------------------------------------------------------------------------------------------------------------------------------------	
	
	2.	Declaring a variable
		********************
	
		*	To declare a variable, you use the DECLARE statement. 
			
			DECLARE @Price AS INT;

------------------------------------------------------------------------------------------------------------------------------------	
		
	3.	Assigning a value to a variable
		*******************************
	
		*	SET @Price = 150000;
		
------------------------------------------------------------------------------------------------------------------------------------	
		
	4.	Using variables in a query
		**************************
		
		*	DECLARE @Price AS INT;

			SET @Price = 150000;

			SELECT 
				Bike_Name,
				Bike_Color,
				Bike_Price
			FROM
				Bike	
			WHERE
				Bike_Price <= @Price
			ORDER BY
				Bike_Name;
			
------------------------------------------------------------------------------------------------------------------------------------	
		
	5.	Storing query result in a variable
		**********************************
		
		*	DECLARE @product_count INT;
	
		*	SET @product_count = (
				SELECT 
					COUNT(*) 
				FROM 
					Bike);
		
		*	SELECT @product_count;
		
		*	PRINT @product_count;

		*	PRINT 'The number of products is ' + CAST(@product_count AS VARCHAR(MAX));
		
		*	OUTPUT
			******
		
		*	The number of products is 204
		
		*	To hide the number of rows affected messages, you use the following statement:
		
		*	SET NOCOUNT ON;

------------------------------------------------------------------------------------------------------------------------------------	
			
	6.	Selecting a record into variables
		*********************************
		
	*	The following steps illustrate how to declare two variables, assign a record to them, and output the contents of the variables:

	*	First, declare variables that hold the product name and list price:
	
	*	DECLARE 
		@product_name VARCHAR(MAX),
		@list_price DECIMAL(10,2);
		
	*	SELECT 
			@product_name = product_name,
			@list_price = list_price
		FROM
			production.products
		WHERE
			product_id = 100;
			
------------------------------------------------------------------------------------------------------------------------------------	


	
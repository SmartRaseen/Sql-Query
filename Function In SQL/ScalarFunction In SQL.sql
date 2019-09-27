
	Scalar Functions
	****************
	
	*	SQL Server scalar function takes one or more parameters and returns a single value.

	*	The scalar functions help you simplify your code. 
		For example, you may have a complex calculation that appears in many queries. 
		Instead of including the formula in every query, 
		you can create a scalar function that encapsulates the formula and uses it in the queries.
		
-----------------------------------------------------------------------------------------------------------------------------------------------------
	
	1.	Create a table for scalar function
		***********************************
		
		*	CREATE TABLE Sales_Products(
			Product_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
			Quantity INT NOT NULL,
			List_Price DECIMAL (10, 2) NOT NULL,
			Discount DECIMAL (4, 2) NOT NULL DEFAULT 0);
	
-----------------------------------------------------------------------------------------------------------------------------------------------------

	2.	Creating a scalar function
		**************************
	
		*	To create a scalar function, you use the CREATE FUNCTION statement as follows:
	
		*	CREATE FUNCTION ProductsFunction(
			@Quantity AS INT,
			@List_Price AS DEC(10,2),
			@Discount AS DEC(4,2))
			RETURNS DEC(10,2)
			AS 
			BEGIN
				RETURN @Quantity * @List_Price * (1 - @Discount);
			END;
			
-----------------------------------------------------------------------------------------------------------------------------------------------------

	3.	Calling a scalar function
		*************************
		
		*	You call a scalar function like a built-in function. 
			For example, the following statement demonstrates how to call the udfNetSale function:
	
		*	EXAMPLE
			*******
			
		*	SELECT 
			dbo.ProductsFunction(10,100,0.1) net_sale;
			
		*	Here is the output:
		
			*	net_sale
				900.00
			
------------------------------------------------------------------------------------------------------------------------------------------------------
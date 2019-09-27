

	Indexes
	*******
	
	*	Indexes are special data structures associated with tables or views that help speed up the query. 
	
	*	SQL Server provides two types of indexes: 
		
		*	Clustered Index and 
		*	Non-Clustered Index.
	
------------------------------------------------------------------------------------------------------------------------------------------------
	
	Introduction to SQL Server clustered indexes
	********************************************
	
	*	The following statement creates a new table named production.parts that consists of two columns part_id and part_name:
	
	*	CREATE TABLE DEMO
		(
			PRODUCT_ID INT NOT NULL,
			PRODUCT_NAME VARCHAR(100) NOT NULL
		);
		
	*	INSERT INTO DEMO(PRODUCT_ID,PRODUCT_NAME) VALUES(1,'Toys'),
		(2,'Mobiles'),
		(3,'Games'),
		(4,'Furnitures'),
		(5,'Sports Kit');

	*	SELECT * FROM DEMO WHERE PRODUCT_ID = 5;
	
	*	The production.parts table does not have a primary key, 
		therefore, SQL Server stores its rows in an unordered structure called a heap.
		
	*	Note that to display the estimated execution plan in SQL Server Management Studio, 
		you click the following button or select the query and press the keyboard shortcut Ctrl-L:

	*	Because the DEMO table has just five rows, the query will execute very fast. 
		However, if the table contains a large number of rows, SQL Server will take a lot of time and resource to search for data.

	*	To resolve this issue, SQL Server provides a dedicated structure to speed up retrieval of rows from a table called index.
		
------------------------------------------------------------------------------------------------------------------------------------------------

	*	Cluster Index
		*************
	
	*	A clustered index stores data rows in a sorted structure based on its key values. 
		Each table has only one clustered index because data rows can be only sorted in one order. 
		
	*	The table that has a clustered index is called a clustered table.

	*	CREATE TABLE Product_Prices(
		Product_ID int,
		Valid_From date,
		Price decimal(18,4) not null,
		PRIMARY KEY(Product_ID, Valid_From));

	*	If you add a primary key constraint to an existing table that already has a clustered index.
	
-----------------------------------------------------------------------------------------------------------

	*	In case a table does not have a primary key.
	
	*	Using SQL Server CREATE CLUSTERED INDEX statement to create a clustered index.

	*	The following statement creates a clustered index for the Product_Prices table.

	*	CREATE CLUSTERED INDEX Index_Product_ID
		ON Product_Prices (Product_ID);	
		
------------------------------------------------------------------------------------------------------------------------------------------------

	*	Non Cluster Index
		*****************
		
	*	CREATE TABLE Sales_Customers (
		Customer_ID INT IDENTITY (1, 1) PRIMARY KEY,
		Customer_Name VARCHAR (255) NOT NULL,
		City VARCHAR (50) NOT NULL);

	*	INSERT INTO Sales_Customers(Customer_Name,City) VALUES('Hameed','Chennai'),
		('Raseen','Nagore'),
		('Kader','Nagore');

	*	SELECT 
			Customer_ID,Customer_Name,City
		FROM 
			Sales_Customers
		WHERE Customer_Name= 'Raseen';

	*	CREATE INDEX index_City
		ON Sales_Customers(City);
		
------------------------------------------------------------------------------------------------------------------------------------------------
		
		
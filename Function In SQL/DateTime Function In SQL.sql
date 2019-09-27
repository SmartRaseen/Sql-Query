
	SQL Server SYSDATETIMEOFFSET() function overview
	************************************************
	
	1.	The SYSDATETIMEOFFSET() function returns a value of DATETIMEOFFSET(7) that represents the current system date and time
	
		*	SYSDATETIMEOFFSET()
		
---------------------------------------------------------------------------------------------------------------------------------------------------------

	2.	For example, to get the current system date and time with the timezone of the Server to which you are connecting, 
		you use this statement:
		
		*	SELECT 
			SYSDATETIMEOFFSET() [datetimeoffset with timezone];
			
		*	The output is follow as

			datetimeoffset with timezone
			----------------------------------
			2019-05-03 08:56:48.0645108 +07:00
 
			(1 row affected)
		
---------------------------------------------------------------------------------------------------------------------------------------------------------
			
	3.	A) Extracting the time zone offset example
	
		The following example uses the DATEPART() function to return the time zone offset. 
		It returns an integer that represents the time zone offset in minutes.
		
		*	SELECT 
			SYSDATETIMEOFFSET() AS [System DateTime Offset],
			DATEPART(TZoffset, SYSDATETIMEOFFSET()) AS [Timezone Offset];
			
		*	Here the output is
		
			System DateTime Offset             Timezone Offset
			---------------------------------- ---------------
			2019-05-03 09:07:30.4093274 +07:00 420
 
			(1 row affected)	
		
---------------------------------------------------------------------------------------------------------------------------------------------------------

	4.	B) Formatting the Time Zone Offset example
		
		*	You can also use the FORMAT() function to return the time zone offset as a string by using :

		*	This example formats the returned timezone offset as a string by using the FORMAT() function with the zz and zzz arguments:
		
		*	SELECT 
			SYSDATETIMEOFFSET() AS 'System Date Time Offset', 
			FORMAT(SYSDATETIMEOFFSET(), 'zz') AS 'zz', 
			FORMAT(SYSDATETIMEOFFSET(), 'zzz') AS 'zzz';
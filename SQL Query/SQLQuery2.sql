USE EmployeeData;

SELECT * FROM Employment_History;

SELECT * FROM Employee

SELECT * 
FROM Employee JOIN Employment_History
ON Employee.EmpHistoryID = Employment_History.EmpHistoryID; 

SELECT Employee.JobID,Employee.Jobtitle,
Employee.Employer,Employee.Description,Employee.EmpHistoryID,Employment_History.EmpFrom,Employment_History.EmpTo 
FROM Employee 
INNER JOIN Employment_History 
ON Employee.EmpHistoryID =Employment_History.EmpHistoryID;

DELETE FROM Employee WHERE EmpHistoryID=1046; DELETE FROM Employment_History WHERE EmpHistoryID=1046;

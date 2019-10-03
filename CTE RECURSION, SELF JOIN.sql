-- Recursive CTE
-- Declare @ID int;
-- Set @ID = 7;
With 
EmployeesCTE (EmployeeID, Name, ManagerId, [Level])
as
	(select EmployeeID,FirstName,ManagerID,1
	from Employees	
	where ManagerID is null -- replace with employeeID = @ID to get org hirarchy for that

	union all 

	select Employees.EmployeeID,Employees.FirstName,Employees.ManagerID,EmployeesCTE.[Level]+1
	from Employees
	join EmployeesCTE
	on Employees.ManagerID = EmployeesCTE.EmployeeID)

	Select EmpCTE. Name as Employee, ISNULL(MngCTE.Name,'Super Boss') as Manager,EmpCTE.Level 
	from EmployeesCTE as EmpCTE left join EmployeesCTE MngCTE
	on EmpCTE.ManagerId = MngCTE.EmployeeID
	
	-------------------
	---CTE
WITH C1 AS 
(   SELECT YEAR(orderdate) AS orderyear, custid   FROM Sales.Orders 
)

, C2 AS 

(   SELECT orderyear, COUNT(DISTINCT custid) AS numcusts   FROM C1   GROUP BY orderyear 
) 

SELECT orderyear, numcusts FROM C2 WHERE numcusts > 70;

--------------

--RECURSIVE CTE

WITH EmpsCTE AS 
(   

SELECT empid, mgrid, firstname, lastname   
FROM HR.Employees   
WHERE empid = 2      

UNION ALL      

SELECT C.empid, C.mgrid, C.firstname, C.lastname   
FROM EmpsCTE AS P     
JOIN HR.Employees AS C       
ON C.mgrid = P.empid 
) 

SELECT empid, mgrid, firstname, lastname FROM EmpsCTE;

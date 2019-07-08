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

-- Delete duplicate rows
with employeeCTE as 
(
		Select *, row_number() over (partition BY EmployeeID  order by EmployeeID) as RowNUmber
		from Employees
)
Delete from employeeCTE where RowNUmber > 1
go
/*
 hired in last 30 days
select*,Datediff(days,HireDate,Getdate()) as diff
from Employees
where Datediff(year,hiredate,getdate()) between 1 and 30
order by HireDate*/





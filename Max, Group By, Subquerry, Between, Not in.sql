use SoftUni
go
select * from Employees
where salary = (select MAX(salary) from Employees)

-- Sencond Highest Salary
Select max (salary)
from Employees
where salary not in (select max(salary) from Employees)

-- nth highest

Select distinct max (salary)
from Employees
where salary not in (select top 1 salary from Employees order by Salary desc) -- just change 1 to any N


select* 
from Employees
where EmployeeID between 2 and 3

/*
Highest salary for each department
*/
select E.Salary,E.FirstName,D.Name

from Employees as E
join Departments as D on e.DepartmentID = d.DepartmentID

where salary in (select MAX(salary) from Employees where DepartmentID = e.DepartmentID  -- normal querry specifiying which dept id to use
group by DepartmentID)
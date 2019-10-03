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


----------------------------------------------
USE TSQL2012; 
SELECT cast(CONVERT(CHAR(8), CURRENT_TIMESTAMP, 112)as date);

SELECT custid, orderid, orderdate, empid 

FROM Sales.Orders AS O1 

WHERE orderid =   (SELECT MAX(O2.orderid)    FROM Sales.Orders AS O2    WHERE O2.custid = O1.custid);
-------------------
SELECT MAX(O2.orderid) FROM Sales.Orders AS O2 WHERE O2.custid = 85
---------------
SELECT orderid, custid, val,   CAST(100* val/(SELECT (SUM(O2.val))fROM Sales.OrderValues AS O2  WHERE O2.custid = O1.custid) AS NUMERIC) AS Pct

FROM Sales.OrderValues AS O1 ORDER BY custid, orderid;
-----------
SELECT custid, companyname 
FROM Sales.Customers AS C WHERE country = N'Spain'   AND EXISTS     (SELECT * FROM Sales.Orders AS O      WHERE O.custid = C.custid);
--------
SELECT custid, companyname 
FROM Sales.Customers AS C WHERE country = N'Spain'   AND not EXISTS     (SELECT * FROM Sales.Orders AS O      WHERE O.custid = C.custid);

SELECT orderid, orderdate, empid, custid,(SELECT MAX(O2.orderid)FROM Sales.Orders AS O2 WHERE O2.orderid < O1.orderid) AS prevorderid FROM Sales.Orders AS O1

SELECT orderid,orderdate,empid,custid,(SELECT MIN(ORDERID)FROM Sales.ORDERS AS O2 WHERE O1.ORDERID < O2.ORDERID )AS NEXTORDERiD FROM Sales.Orders AS O1

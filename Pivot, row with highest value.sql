
/*

PIVOT ROWS INTO COULUMS
Select Country, City1, City2, City3
From
(
  Select Country, City,
    'City'+
      cast(row_number() over(partition by Country order by Country) 
     as varchar(10)) ColumnSequence
  from Countries
) Temp
pivot
(
  max(City)
  for ColumnSequence in (City1, City2, City3)
) Piv
*/

SELECT TOP 1 Departments.Name, COUNT(*) as totNo
FROM Employees
JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY Name
ORDER BY COUNT(*) DESC






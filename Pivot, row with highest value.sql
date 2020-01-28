
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

-------------------------------------------------------------------------------------------------

;with ctePersonCount as(
SELECT  [sex],  [name],[year],number
,PCounts = row_number() over (partition by [year] order by number desc)
from dbo.AllYears	
WHERE sex = 'M' and [YEAR] between 2000 AND 2010
)  
Select * 
from ctePersonCount

pivot(
Sum(ctePersonCount.number)
for year in ( [2000],[2001],[2002],[2003],[2004],[2005],[2006],[2007],[2008],[2009],[2010])
) p
where PCounts between 1 and 10 order by p.PCounts asc






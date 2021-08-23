Traditional
Aggregate - Sum, Count and Max - Compramise level of detail as the output only includes sum or count or max - Scalar value

Group By  - To add new field on aggregated query and to group based on the value added in group by
            but does not display subtotals for the selected group
New way
Wiondow Function - Allows use sum, count, to groups or all the rows in dataset.
                 - Retains row level detail as well, agregate calculations becames another columns               
SUM (Sales YTD) OVER ()

Partition BY           - TO compute aggreggate totals (subtotals) for groups while using window function
                       - Contrast to group by where non aggregated columns are specified, in partition by we specify the columns.
SUM (Sales YTD) OVER ( [ProductID, [OrderQty])

Subqueries        - there is limitation with Window function which can be used in select or order by

                  -  so to apply filter in select or where clause subqueries are needed
                  Correlated Subqueries
                  - return a scalar result to main query
                  - inner query joins with the outer query by where clause
                  
 Exists - for one to many relationship if we want to filter out by specific criteria and not return any data
                        
          - Goes into where clause
          
CTE       - sequencial build of query contrast to subqueries. Reusable, less code

Recursive CTE - To generate series of numbers which whould need lots of UNIONs otherwise eg. 365 days of the year in a column
                3 components  Anchor, Recursion query and termination condition. CTE then called by select.
                - with cte1 as (select 1 as series union all select series +1  from cte1 where series<99)select * from cte1

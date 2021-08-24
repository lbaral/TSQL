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
                
Temp Tables             - Tackles limitations of CTE like reusability and troubleshooting, and being query level scope.
                        - In contrast Temp table is session scoped
                        - Help to specipy data type of field
                        - CREATE, INSERT and oPDATE
            
Optimisation            - Update can be run multiple times unlike insert which duplicates record, Use Update with temp table when select with multiple joins is huge
                        - Exists vs Update will - to grab (a/any)data on secondary table on many side of relationship
                        
Index                - Clustered Index - Physically sort data in a table, PK is Clustered Index by default. There can be only one Clustered Index on the table
                                    - Can be a combination of one or more keys which are unique
                                    - Use in field/fields most used in the joins
                     - Non Clustered Index- Not a physical sorting of data, table may have many non-clustered indexes. The field or fields non-clustered indexes
                                    apply to is stored in an external data structure. Still should have a high level of uniqueness.
                        
                        
Lookup Tables                       - Eliminate redundant code, and have a single source of truth, add simplicity

Variable                            -Named placeholder, use it in multiple places. Break down piece of complex manipulation e.g. finding last day of a month.

Functions                           - When builtin is not enough. 
                                    - data type the function returns, does function takes parameter,
                     
Stored Proc                         - Database objects that gives infinate range of possibilities. 
                                    - Dynamic user driven reports
                        - COntrol Flow with if and else
                        - SQL allows just to run if and not else, in this case the execution just moves on to another piece of code
                        
                        
Dynamic SQL             - A text string that is a valid sql code
                        - A code that writes itself. if a query is repeated with just a slight variations. 
                        - take parameter passed into proc to dynamically construct one sequel query that incorporates the result
                        - Buid the @dynamicsql step by step
                       
                     
            

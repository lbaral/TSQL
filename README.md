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

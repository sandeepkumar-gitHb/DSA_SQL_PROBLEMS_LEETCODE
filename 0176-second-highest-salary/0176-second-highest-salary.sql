# Write your MySQL query statement below
WITH cte AS (
    Select  DISTINCT salary, 
     DENSE_RANK() OVER (ORDER BY salary DESC)  rnk 
     FROM Employee)

SELECT COALESCE(
    (
        SELECT salary 
        From cte
        where rnk = 2
        limit 1
    ),NULL) AS SecondHighestSalary ;
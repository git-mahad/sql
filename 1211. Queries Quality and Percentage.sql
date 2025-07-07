# Write your MySQL query statement below
Select query_name, Round(AVG(rating/position),2) AS quality,
Round(AVG(if(rating < 3, 1, 0))*100,2) AS poor_query_percentage
FROM Queries
GROUP BY query_name
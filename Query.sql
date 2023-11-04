SELECT * FROM [mobile game].[dbo].cookie_cats

/*Experiment Analysis*/
/*Binary outcomes Chi-Squared Test*/

/*contingency table*/
/*retention_1*/
SELECT version, COUNT(CASE WHEN retention_1 = 'FALSE' THEN 1 ELSE NULL END) as retention_1_F,
COUNT(CASE WHEN retention_1 = 'TRUE' THEN 1 ELSE NULL END) as retention_1_T,
COUNT(CASE WHEN retention_1 = 'FALSE' THEN 1 ELSE NULL END) + COUNT(CASE WHEN retention_1 = 'TRUE' THEN 1 ELSE NULL END) as total,
ROUND(COUNT(CASE WHEN retention_1 = 'TRUE' THEN 1 ELSE NULL END)*100.0 / (COUNT(CASE WHEN retention_1 = 'FALSE' THEN 1 ELSE NULL END) + COUNT(CASE WHEN retention_1 = 'TRUE' THEN 1 ELSE NULL END)),2) as success_percentage
FROM [mobile game].[dbo].cookie_cats
GROUP BY version

/*retention_7*/
SELECT version,
COUNT(CASE WHEN retention_7 = 'FALSE' THEN 1 ELSE NULL END) as retention_7_F,
COUNT(CASE WHEN retention_7 = 'TRUE' THEN 1 ELSE NULL END) as retention_7_T,
COUNT(CASE WHEN retention_7 = 'FALSE' THEN 1 ELSE NULL END) + COUNT(CASE WHEN retention_7 = 'TRUE' THEN 1 ELSE NULL END) as total,
ROUND(COUNT(CASE WHEN retention_7 = 'TRUE' THEN 1 ELSE NULL END)*100.0 / (COUNT(CASE WHEN retention_7 = 'FALSE' THEN 1 ELSE NULL END) + COUNT(CASE WHEN retention_7 = 'TRUE' THEN 1 ELSE NULL END)),2) as success_percentage
FROM [mobile game].[dbo].cookie_cats
GROUP BY version

/*At first glance, the success percentage seems close and no version has any statical significance over the other one. 
Using this contingency table, we can use any online calculator to determine the statistical significance of each result we obtained 
from this query*/

/*Continues outcomes t-test*/

/*gamerounds*/
SELECT version, COUNT(sum_gamerounds) as total, ROUND(AVG(CAST(sum_gamerounds as NUMERIC)),2) as average, 
ROUND(STDEV(CAST(sum_gamerounds as NUMERIC)),2) as stdv
FROM [mobile game].[dbo].cookie_cats
GROUP BY version

/*At first glance, the averages seem close and no version has any statical significance over the other one. 
Using this table of count, average, stdev (which are the three values used in t-test), we can use any online calculator to 
determine the statistical significance of each result we obtained from this query*/


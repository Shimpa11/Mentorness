create database  if not exists walmart ;
use walmart;
show tables;
select * from walmartdata where Branch="A";


SELECT Product_line, 
      round( SUM(Total)) AS total_sales
FROM walmartdata
GROUP BY Product_line;


select * from walmartdata where Payment= 'Cash';


SELECT City,
       round(SUM(gross_income)) AS total_gross_income
FROM walmartdata
GROUP BY City;


select Branch,
round(avg(Rating),2) as Avg_Rating from walmartdata group by Branch;

select * from walmartdata;
select Product_line,
sum(Quantity) as total_quantity from walmartdata group by Product_line;

select * from walmartdata;
SELECT Invoice_ID,
       product_line,
       Unit_price
FROM walmartdata
ORDER BY unit_price DESC
LIMIT 5;

SELECT Invoice_ID,
       Total,
       cogs,
      (Total-cogs)  AS gross_profit
FROM walmartdata
having gross_profit >30;


select Date,Total FROM walmartdata
WHERE date_format(Date ,'%w') IN ('Saturday', 'Sunday');



SELECT COUNT(*) AS number_of_transactions
FROM walmartdata
WHERE TIME(Time) > '18:00:00';

SELECT *FROM walmartdata
WHERE Total > (SELECT AVG(Total) FROM walmartdata);






select Branch, Date, sum(gross_income)
from walmartData
group by Branch,Date;

select   City ,sum(cogs) as total_cogs
from walmartdata
group by City;

select Invoice_ID, Date,City,Total
from walmartdata

where dayname(Date) in (1,7);


select City,
    SUM(total) AS total_sales,
    SUM(total - cogs) AS gross_income
FROM walmartdata
GROUP BY City
ORDER BY total_sales;





select Invoice_ID, month(Date) as month
from walmartdata;


describe walmartdata;
SELECT 
    Invoice_ID, 
    MONTH(STR_TO_DATE(Date, '%Y-%m-%d')) AS month
FROM walmartdata;

SELECT 
    DATE_FORMAT(STR_TO_DATE(Date, '%Y-%m-%d'), '%Y-%m') AS month,
    SUM(Total) AS total_sales,
    SUM(Total - cogs) AS gross_income
FROM walmartdata
GROUP BY DATE_FORMAT(STR_TO_DATE(Date, '%Y-%m-%d'), '%Y-%m')
ORDER BY month;

select Total,date_format(STR_TO_DATE(Date, '%Y-%m-%d'), '%Y-%m-%d') as transaction_date
from walmartdata
where dayofweek(date_format(STR_TO_DATE(Date, '%Y-%m-%d'), '%Y-%m-%d')) in (5,6);

SELECT 
    Date, 
    STR_TO_DATE(Date, '%d-%m-%Y') AS converted_date
FROM 
    walmartdata
LIMIT 10;
-- SELECT
--     Invoice_ID,(STR_TO_DATE(Date, '%d-%m-%Y'), '%m-%Y') AS month,
--     COUNT(*) quantity AS num_purchases
-- FROM     walmartdata
-- GROUP BY Invoice_ID,
--     
--     DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%m-%Y') 
-- HAVING
--     COUNT(*) > 5
-- ORDER BY
--     Customer_ID,
--     month;

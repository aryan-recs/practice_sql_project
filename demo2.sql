CREATE DATABASE IF NOT EXISTS aryan_db;

USE aryan_db;

CREATE TABLE IF NOT EXISTS shopping(
Customer_ID INT UNIQUE,
Age INT,
Gender VARCHAR(50),
Item_Purchased VARCHAR(50),
Category VARCHAR(50),
Purchase_Amount_USD INT,
Location VARCHAR(50), 
Size VARCHAR(50),
Color VARCHAR(50),
Season VARCHAR(50),
Review_Rating FLOAT,
Subscription_Status VARCHAR(50), 
Payment_Method VARCHAR(50),
Shipping_Type VARCHAR(50),
Discount_Applied VARCHAR(50), 
Promo_Code_Used VARCHAR(50),
Previous_Purchases VARCHAR(50), 
Preferred_Payment_Method VARCHAR(50),
Frequency_of_Purchases VARCHAR(50)

);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/shopping_trends.csv'
INTO TABLE shopping
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT * FROM shopping;

SELECT SUM(Purchase_Amount_USD) AS total_cost FROM shopping;

SELECT category,Size FROM shopping;

SELECT DISTINCT category,size FROM shopping;

SELECT Item_Purchased, size, Purchase_Amount_USD
FROM shopping 
WHERE Purchase_Amount_USD>35 AND SIZE = 'M ' | 'S';

SELECT Category, Review_Rating  
FROM shopping 
WHERE Customer_ID IN ('23','36','54');

SELECT size, Age, Color 
FROM shopping 
WHERE Color LIKE '%green%';

SELECT Item_Purchased, Color,Size, Purchase_Amount_USD 
FROM shopping 
WHERE Gender NOT IN ('Female');

UPDATE shopping
SET Purchase_Amount_USD = '42'
WHERE Customer_ID = '1';

UPDATE shopping
SET Review_Rating = '5.8'
WHERE Customer_ID = '1';

SELECT * FROM shopping
WHERE Customer_ID = '1'

SELECT Item_Purchased,Purchase_Amount_USD as cost FROM shopping
ORDER BY cost DESC;

SELECT Age, Gender, Purchase_Amount_USD 
AS price_by_age 
FROM shopping 
ORDER BY price_by_age DESC LIMIT 10;

SELECT Gender, Season, Color 
AS deta FROM shopping 
WHERE Review_Rating>2 
ORDER BY deta DESC ;

SELECT Season,SUM(Purchase_Amount_USD) 
AS valuess FROM shopping 
GROUP BY Season 
ORDER BY valuess DESC;

SELECT Age ,  Item_Purchased AS purchased
FROM shopping
GROUP BY Age
ORDER BY Age ASC ;
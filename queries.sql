
                                                     RETAIL SALES ANALYSIS PROJECT



USE retail_project;


 1. CREATE TABLE

CREATE TABLE samplesuperstore (
    Order_id VARCHAR(20),
    Customer_names VARCHAR(50),
    Segment VARCHAR(30),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code INT,
    Region VARCHAR(20),
    Category VARCHAR(30),
    Sub_Category VARCHAR(30),
    Sales FLOAT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT,
    Total_Sales FLOAT
);


2. BASIC DATA CHECK

SELECT * FROM samplesuperstore LIMIT 10;

SELECT COUNT(*) AS Total_Records 
FROM samplesuperstore;

SELECT DISTINCT Category 
FROM samplesuperstore;


 3. OVERALL PERFORMANCE

SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM samplesuperstore;


4. CATEGORY ANALYSIS

SELECT 
    Category,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Category
ORDER BY Total_Sales DESC;


 5. SUB-CATEGORY ANALYSIS

SELECT 
    Sub_Category,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Sub_Category
ORDER BY Total_Sales DESC
LIMIT 10;


 6. TOP SELLING PRODUCTS

SELECT 
    Sub_Category,
    SUM(Quantity) AS Total_Quantity
FROM samplesuperstore
GROUP BY Sub_Category
ORDER BY Total_Quantity DESC
LIMIT 10;


 7. REGION ANALYSIS

SELECT 
    Region,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Region
ORDER BY Total_Sales DESC;


8. PROFIT ANALYSIS

SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY Category
ORDER BY Total_Profit DESC;


 9. LOSS MAKING SUB-CATEGORIES

SELECT 
    Sub_Category,
    SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY Sub_Category
HAVING Total_Profit < 0;


 10. CUSTOMER ANALYSIS

SELECT 
    Customer_names,
    SUM(Sales) AS Total_Spent
FROM samplesuperstore
GROUP BY Customer_names
ORDER BY Total_Spent DESC
LIMIT 10;


 11. SEGMENT ANALYSIS

SELECT 
    Segment,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Segment
ORDER BY Total_Sales DESC;


 12. DISCOUNT IMPACT

SELECT 
    Discount,
    AVG(Profit) AS Avg_Profit
FROM samplesuperstore
GROUP BY Discount
ORDER BY Discount;


13. AVERAGE ORDER VALUE

SELECT 
    SUM(Sales) / COUNT(DISTINCT Order_id) AS Avg_Order_Value
FROM samplesuperstore;


14. TOP 5 STATES BY SALE

SELECT 
    State,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 5;


 15. CITY LEVEL ANALYSIS

SELECT 
    City,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;
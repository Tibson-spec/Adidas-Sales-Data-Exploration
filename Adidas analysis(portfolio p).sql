--Adidas Sales Data Exploration

--Analyzing total sales of each product to identify the best-selling items 
SELECT 
   Product,
   SUM([Units Sold]) AS TotalQuantitySold,
   SUM([Total Sales]) AS TotalSalesAmount
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    Product
ORDER BY 
     TotalSalesAmount DESC;

--Analyzing total sales and unit sold by region
SELECT 
   Region,
   SUM([Units Sold]) AS TotalUnitSold,
   SUM([Total Sales]) AS TotalSalesAmount
FROM 
    ['Data_Sales _Adidas] s
JOIN Location l ON s.[Location Key] = l.LocationKey
GROUP BY 
    Region
ORDER BY 
     TotalSalesAmount DESC;

--Determining Profitability Margin across region
SELECT 
   Region,
	AVG([Operating Margin]) AS ProfitMargin
FROM 
    ['Data_Sales _Adidas] f
JOIN Location l ON f.[Location Key] = l.LocationKey
GROUP BY 
    Region
ORDER BY 
     ProfitMargin DESC;

--Identify which products are the most profitable and which ones have the highest margins.
SELECT 
    Product,
    SUM([Operating Profit]) AS Total_Operating_Profit,
    ROUND(AVG([Operating Margin]),2) AS Average_Operating_Margin
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    Product
ORDER BY 
    Total_Operating_Profit DESC;

-- Analyzing top-10 performing geographic areas for the business.
SELECT TOP 10
    L.City,
    L.State,
    SUM(S.[Total Sales]) AS Total_Sales
FROM 
    ['Data_Sales _Adidas] S
JOIN 
    Location L ON S.[Location Key] = L.LocationKey
GROUP BY 
    L.City, 
	L.State
ORDER BY 
    Total_Sales DESC;

--Analyzing whether higher-priced products contribute more to revenue or if lower-priced items sell in higher volume.
SELECT 
    Product,
    ROUND(AVG([Price per Unit]),2) AS Average_Price,
    SUM([Total Sales]) AS Total_Sales
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    Product
ORDER BY 
    Average_Price DESC;

--Evaluating which sales method (channel) is more profitable and generates more revenue.
SELECT 
    [Sales Method],
    SUM([Total Sales]) AS Total_Sales,
    ROUND(SUM([Operating Profit]),2) AS Total_Operating_Profit
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    [Sales Method]
ORDER BY Total_Operating_Profit DESC;

--Analyzing Top Products by Units Sold i.e most popular products by sales volume.
SELECT
    Product,
    SUM([Units Sold]) AS Total_Units_Sold
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    Product
ORDER BY 
    Total_Units_Sold DESC;

--Analyzing which retailers contribute the most to overall sale.
SELECT 
    Retailer,
    SUM([Total Sales]) AS Total_Sales
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    Retailer
ORDER BY 
    Total_Sales DESC;

--Analyzing the frequency with which retailers make purchases.
SELECT distinct
    [Retailer ID],
    COUNT([Invoice Date]) AS Purchase_Frequency
FROM 
   ['Data_Sales _Adidas]
GROUP BY 
    [Retailer ID]
ORDER BY 
    Purchase_Frequency DESC;

--Analyzing the most profitable product by sales channel.
SELECT TOP 5
    [Sales Method],
    Product,
    ROUND(AVG([Operating Margin]),3) AS Average_Operating_Margin
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    [Sales Method],
	Product
ORDER BY 
    Average_Operating_Margin DESC;

--determining regional and channel-specific average order values.
SELECT TOP 5
    L.Region,
    S.[Sales Method],
    AVG(S.[Total Sales]) AS Average_Order_Value
FROM 
    ['Data_Sales _Adidas] S
JOIN 
    [Location] L ON S.[Location Key] = L.LocationKey
GROUP BY 
    L.Region, 
	S.[Sales Method]
ORDER BY 
     Average_Order_Value DESC;





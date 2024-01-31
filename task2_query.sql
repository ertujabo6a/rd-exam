USE AdventureWorksDW2017;

DROP TABLE IF EXISTS #OrderQuantity
SELECT FactInternetSales.ProductKey, 
DimProduct.EnglishProductName,
DimProductCategory.EnglishProductCategoryName,
SUM(OrderQuantity) AS TotalOrdersByMonths,
DimDate.EnglishMonthName,
DimDate.CalendarQuarter,
DimDate.CalendarYear
INTO #OrderQuantity
FROM FactInternetSales
JOIN DimProduct
ON FactInternetSales.ProductKey = DimProduct.ProductKey
JOIN DimProductSubcategory
ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
JOIN DimProductCategory
ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
JOIN DimDate
ON FactInternetSales.OrderDateKey = DimDate.DateKey
GROUP BY FactInternetSales.ProductKey,
DimProduct.EnglishProductName,
DimProductCategory.EnglishProductCategoryName,
DimDate.EnglishMonthName,
DimDate.CalendarQuarter,
DimDate.CalendarYear;

SELECT ProductKey, EnglishProductName, EnglishProductCategoryName,
AVG(TotalOrdersByMonths) AS [Average Total Orders By Month],
EnglishMonthName, CalendarQuarter, CalendarYear
FROM #OrderQuantity
GROUP BY ProductKey, EnglishProductName, EnglishProductCategoryName,
EnglishMonthName, CalendarQuarter, CalendarYear
HAVING AVG(TotalOrdersByMonths) > 20
AND ((CalendarQuarter = 4 and CalendarYear=2011)
OR (CalendarQuarter = 4 and CalendarYear=2011))
ORDER BY 1;
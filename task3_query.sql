USE AdventureWorksDW2017;

SELECT DISTINCT DP.ProductKey, EnglishProductName, EnglishProductSubcategoryName,
EnglishProductCategoryName, SalesTerritoryRegion, SalesAmount, 
COUNT(OrderQuantity) AS Pocet, SalesAmount * COUNT(OrderQuantity) AS Obrat, EnglishMonthName
FROM DimProductCategory AS DPC
JOIN DimProductSubcategory AS DPS
ON DPC.ProductCategoryKey = DPS.ProductCategoryKey
JOIN DimProduct AS DP
ON DPS.ProductSubcategoryKey = DP.ProductSubcategoryKey
JOIN FactInternetSales AS FIS
ON DP.ProductKey = FIS.ProductKey
JOIN DimSalesTerritory AS DST
ON FIS.SalesTerritoryKey = DST.SalesTerritoryKey
JOIN DimDate AS DD
ON FIS.OrderDateKey = DD.DateKey
GROUP BY DP.ProductKey, EnglishProductName, 
EnglishProductSubcategoryName, EnglishProductCategoryName, 
SalesTerritoryRegion, SalesAmount, 
OrderQuantity, EnglishMonthName, OrderDate
HAVING SalesAmount * COUNT(OrderQuantity) > 2500 AND YEAR(OrderDate) = '2012' AND SalesTerritoryRegion IN ('France', 'Germany')
ORDER BY SalesTerritoryRegion;

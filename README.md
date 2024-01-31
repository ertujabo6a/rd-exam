## Relational Databases Final Exam
Task 1 is a query from database_creation.sql, 
Tasks 2&3 are queries from the open MS SQL Database AdventureWorksDW2017.

### Task 1

We need to list suppliers (company name), insertion date, item name, unit price, selling price per unit, margin, quantity in stock, the value of stock in CZK for each item, category number, and category name in which the item is classified. We are interested only in items where the margin is greater than the average margin of all items, the record was inserted in the year 2023, and there are more than 5 pieces in stock. Sort the output in descending order by the quantity of units.


### Task 2

The business department needs to present a report to the company's management on how the average sales of products have evolved in the year-over-year comparison between 2011 and 2012, specifically for the 4 quarters of trading (October, November, December). From the Adventure WorksDW2017 database, we need to determine the average monthly volume of internet sales (OrderQuantity) for the 4 quarters of 2011 and 2012, including the name of the category in which the products are classified and where the average sales volume per month is greater than 20.

Hints:

1. Data is available in tables [dbo].[FactInternetSales], [dbo].[DimDate], [dbo].[DimProduct], [dbo].[DimProduct Category], and [dbo].[DimProductSubcategory].
2. The average will be calculated over aggregated volumes of monthly sales in units (OrderQuantity). Name this column "TotalOrdersByMonth" for the output of aggregated data.
3. Calculate the average volume of monthly sales, name the column with the calculated average 'Average Total Orders By Month'. Simultaneously, we are interested only in products where the average volume of monthly sales > 20. The resulting set of records will therefore contain the columns:
    (ProductKey) from the [dbo.][FactInternetSales] table,
    (EnglishProductName) from the [dbo].[DimProduct] table,
    (EnglishProductCategoryName) from the [dbo].[DimProductCategory] table,
    (Average Total Orders By Month) - calculated average volume of monthly sales,
    (EnglishMonthName), (CalendarQuarter), (CalendarYear) from the [dbo].[DimDate] table.

### Task 3

We need to output a list of products (product number, name, subcategory, and category) that were ordered through the online store in EU countries, including the names of the countries and the months when the orders were created. At the same time, we need to know the selling price per unit, the number of units sold (rename to "pocet"), and the total turnover (rename to "obrat"). We are interested in products where the total turnover is greater than 2500, and the order was created in the year 2012. Sort the output by the names of the countries.
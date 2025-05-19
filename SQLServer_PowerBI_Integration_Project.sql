-- SQL Server and PowerBI Integration Project

-- Step 1: Download the Microsoft database: AdventureWorksDW2014.bak using the link:
--https://docs.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms

-- Step 2: Restore database in SQL Server

-- Step 3 - Project definition: 
--Build a data panel in PowerBI that presents a report on the results of AdventureWorks' internet sales, showing the following indicators:

-- Total revenue
-- Quantity of products Sold
-- Total Product by Categorie
-- Quantity of customers
-- Total Revenue vs monthly revenue
-- Profit Margin
-- Quantity Sold by country
-- Profit by country
-- Sales by country
-- Customers by country
-- Sales by gender
-- Sales by category

-- Include all the years of the base 
-- The currency issue should be ignored for this exercise

-- Step 4: Getting to know the database and Defining the tables to be analyzed

SELECT * FROM FactInternetSales
SELECT * FROM DimCustomer
SELECT * FROM DimGeography
SELECT * FROM DimProduct
SELECT * FROM DimProductCategory
SELECT * FROM DimProductSubcategory

-- Step 5: Define the necessary columns of the fact table to create the relationships

SELECT
	ProductKey,
	CustomerKey,
	SalesTerritoryKey,
	SalesOrderNumber,
	OrderQuantity,
	UnitPrice,
	TotalProductCost,
	SalesAmount,
	OrderDate
FROM FactInternetSales


-- Setp 6: Perform JOINS with the other tables to assemble the final table and create a view

CREATE OR ALTER VIEW vwfAdventureWorksSales
AS
SELECT
	FactInternetSales.SalesOrderNumber,
	FactInternetSales.OrderDate,
	DimProductCategory.EnglishProductCategoryName AS 'Category',
	FactInternetSales.CustomerKey,
	CASE
	WHEN DimCustomer.MiddleName IS NULL THEN CONCAT(FirstName,' ', LastName)
	ELSE CONCAT(FirstName,' ',MiddleName,' ', LastName)
	END AS 'CustomerName',
	REPLACE(REPLACE(DimCustomer.Gender, 'M', 'Male'), 'F', 'Female') AS 'Gender',
	DimGeography.EnglishCountryRegionName AS 'Country',
	FactInternetSales.OrderQuantity,
	FactInternetSales.UnitPrice,
	FactInternetSales.TotalProductCost,
	FactInternetSales.SalesAmount,
	FactInternetSales.SalesAmount - FactInternetSales.TotalProductCost AS 'Profit'
FROM FactInternetSales
INNER JOIN DimProduct ON FactInternetSales.ProductKey = DimProduct.ProductKey
	INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
	INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey

SELECT * FROM vwAdventureWorksSales

-- Second way from Step 6: Creating separeate views:

CREATE OR ALTER VIEW vwfInternetSales
AS
SELECT
	OrderDate,
	ProductKey,
	CustomerKey,
	SalesOrderNumber,
	OrderQuantity,
	UnitPrice,
	TotalProductCost,
	SalesAmount,
	SalesAmount - TotalProductCost AS 'Profit'
FROM FactInternetSales



CREATE OR ALTER VIEW vwdCostumers
AS
SELECT 
	CustomerKey,
	CASE
	WHEN MiddleName IS NOT NULL THEN CONCAT(FirstName,' ',MiddleName,' ', LastName)
	ELSE CONCAT(FirstName,' ', LastName)
	END AS 'CustomerName',
	Gender,
	GeographyKey
FROM DimCustomer


CREATE OR ALTER VIEW vwdProduct
AS
SELECT
	ProductKey,
	EnglishProductName,
	EnglishProductCategoryName,
	EnglishProductSubcategoryName,
	StartDate,
	EndDate,
	[Status]
FROM DimProduct
INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
	INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey


CREATE OR ALTER VIEW vwdGeography
AS
SELECT
	GeographyKey,
	City,
	EnglishCountryRegionName
FROM DimGeography
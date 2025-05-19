# SQLServer and PowerBI Project
On this project the objective was to integrate SQLServer with Power BI to create a commercial dashboard analyzing the online sales and also the customers. The goal is to understand the business across the time and find inghts that can help the company to grow. 
![dashboard_2](https://github.com/user-attachments/assets/15fa3659-61bf-4358-a635-67120579b0c7)

- Tools and Softaware: SQLServer, Power BI
- Database: AdventureWorks2014 - Microsoft example database

## Project Steps

Step 1: Download the Microsoft database: AdventureWorksDW2014.bak using the link: https://docs.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms

Step 2: Restore database in SQL Server

Step 3 - Project definition: Creation of a data panel in PowerBI, to analyse the entire history of AdventureWorks and their commercial teams and opportunities. The following indicators will be analyzed:

- Total Revenue
- Total Profit
- Total Cost
- Order Quantity
- Average Ticket
- Customer Quantity
- Customer Gender

Step 4: Database exploration and defining the tables to be analyzed:
- FactInternetSales
- DimCustomer
- DimGeography
- DimProduct
- DimProductCategory
- DimProductSubcategory

Step 5: Define the necessary columns of the fact table to create the relationships

Step 6: Perform JOIN with the other tables to assemble the final table and create a view

Step 7: Integration with PowerBI

Step 8: Create a dashboard on PowerBI

## Analysis
- **History of Adventure Works:**
Adventure Works' online sales began in 2010 with the bicycles category, a category with a high average ticket, but month after month the cost of this category was higher than the profit. In 2012, they introduced two more categories: Accessories and Clothing, both categories with a low average ticket. Bicycle sales declined at the expense of these new categories, so Accessories became the company's best-selling category and the only one with a profit higher than the cost.

- **Cost vs. profit:**
The Bicycle category is the one with the highest average ticket, but its sales volume is decreasing every quarter, so revenue is also decreasing, because the cost of this category is higher than the profit. When the company introduces new categories, it accepts the challenge that this new category has a low average ticket, but gains in volume, so that the “Accessories” category becomes the company's most profitable category. Opportunity to rethink the product portfolio.

- **Customer and average ticket:**
The percentage of women and men is almost 50/50, so all strategies must be created with both genders in mind. The United States becomes the leading market, overtaking Australia, which can be explained by it being the second country with the lowest average ticket. Price opportunity to develop other countries, such as those in Europe.











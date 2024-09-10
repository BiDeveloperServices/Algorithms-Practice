/*Dynamic SQL with Conditional Logic and Error Handling 

Problem Statement: You are tasked with creating a stored procedure that dynamically builds and executes an SQL query based on input parameters. The procedure should filter records from a Sales table based on a date range and a minimum sales amount. If the input parameters are invalid (e.g., the end date is before the start date or the minimum sales amount is negative), the procedure should raise an appropriate error. 

Requirements: 

• The Sales table has the following columns: SaleID, SaleDate, SaleAmount, CustomerID. 

• Input parameters: @StartDate DATE, @EndDate DATE, @MinSaleAmount DECIMAL(10, 2). 

• If @StartDate is after @EndDate, raise an error. 

• If @MinSaleAmount is negative, raise an error. 

• The procedure should return all columns from the Sales table where SaleDate is between @StartDate and @EndDate and SaleAmount is greater than or equal to @MinSaleAmount. */


CREATE PROCEDURE GetFilteredSales 

    @StartDate DATE, 

    @EndDate DATE, 

    @MinSaleAmount DECIMAL(10, 2) 

AS 

BEGIN 

    IF @StartDate > @EndDate 

    BEGIN 

        RAISERROR('Start date cannot be after end date.', 16, 1); 

        RETURN; 

    END 

   

    IF @MinSaleAmount < 0 

    BEGIN 

        RAISERROR('Minimum sale amount cannot be negative.', 16, 1); 

        RETURN; 

    END 

   

    DECLARE @SQL NVARCHAR(MAX); 

    SET @SQL = 'SELECT * FROM Sales WHERE SaleDate BETWEEN @StartDate AND @EndDate AND SaleAmount >= @MinSaleAmount'; 



    EXEC sp_executesql @SQL, N'@StartDate DATE, @EndDate DATE, @MinSaleAmount DECIMAL(10,2)', @StartDate, @EndDate, @MinSaleAmount; 

END

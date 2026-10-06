SELECT DB_NAME() AS DatabaseName;
GO

SELECT
    (SELECT COUNT(*) FROM dbo.Customers) AS Customers,
    (SELECT COUNT(*) FROM dbo.Products) AS Products,
    (SELECT COUNT(*) FROM dbo.Orders) AS Orders;
GO

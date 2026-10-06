CREATE TABLE dbo.Customers
(
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    CreatedDate DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

CREATE TABLE dbo.Products
(
    ProductId INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE dbo.Orders
(
    OrderId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    OrderDate DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),

    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerId)
        REFERENCES dbo.Customers(CustomerId),

    CONSTRAINT FK_Orders_Products
        FOREIGN KEY (ProductId)
        REFERENCES dbo.Products(ProductId)
);

INSERT INTO dbo.Customers
    (FirstName, LastName, Email, City)
VALUES
    ('Thabo',  'Nkosi',    'thabo@demo.local',  'Johannesburg'),
    ('Lerato', 'Mokoena',  'lerato@demo.local', 'Pretoria'),
    ('Sipho',  'Dlamini',  'sipho@demo.local',  'Midrand'),
    ('Naledi', 'Molefe',   'naledi@demo.local', 'Centurion'),
    ('Kabelo', 'Mahlangu', 'kabelo@demo.local', 'Sandton');

INSERT INTO dbo.Products
    (ProductName, Category, Price)
VALUES
    ('Airtime R50',         'Airtime',    50.00),
    ('Airtime R100',        'Airtime',   100.00),
    ('1GB Data Bundle',     'Data',       85.00),
    ('5GB Data Bundle',     'Data',      299.00),
    ('Electricity Voucher', 'Utilities', 500.00);

INSERT INTO dbo.Orders
    (CustomerId, ProductId, Quantity)
VALUES
    (1,1,2),
    (2,3,1),
    (3,5,1),
    (4,4,2),
    (5,2,3);

PRINT 'Dummy production data created successfully';

SELECT
    (SELECT COUNT(*) FROM dbo.Customers) AS Customers,
    (SELECT COUNT(*) FROM dbo.Products) AS Products,
    (SELECT COUNT(*) FROM dbo.Orders) AS Orders;
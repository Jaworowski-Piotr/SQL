-- Use adventureworks
-- GO

-- SELECT
-- c.CustomerID 
--     , C.CompanyName
--     , C.FirstName
--     , c.LastName
-- FROM SalesLT.Customer as c
-- WHERE c.CustomerID BETWEEN 1 AND 9

-- UNION

-- SELECT
-- c.CustomerID 
--     , C.CompanyName
--     , C.FirstName
--     , c.LastName
-- FROM SalesLT.Customer as c
-- WHERE c.CustomerID BETWEEN 10 AND 19

-- SELECT color FROM SalesLT.Product
-- WHERE ProductID BETWEEN 500 and 750
-- INTERSECT
-- SELECT color FROM SalesLT.Product
-- WHERE ProductID BETWEEN 751 and 1000;

-- SELECT color FROM SalesLT.Product
-- WHERE ProductID BETWEEN 751 and 1000
-- EXCEPT
-- SELECT color FROM SalesLT.Product
-- WHERE ProductID BETWEEN 500 and 750; 

-- SELECT color FROM SalesLT.Product
-- WHERE ProductID BETWEEN 500 and 750
-- EXCEPT
-- SELECT color FROM SalesLT.Product
-- WHERE ProductID BETWEEN 751 and 1000;


-- ------------------ LAB --------------------

-- SELECT 
--     CompanyName
-- FROM SalesLT.Customer
-- Where CustomerID BETWEEN 1 AND 20000
-- UNION
-- SELECT
--     CompanyName
-- FROM SalesLT.Customer
-- WHERE CustomerID BETWEEN 20000 AND 40000


--  -- Prepare tables
--  DECLARE @t1 AS table
--  (Name nvarchar(30) NOT NULL);
--  DECLARE @t2 AS table
--  ([Name] nvarchar(30) NOT NULL);
--  INSERT INTO @t1 ([Name])
--      VALUES
--          (N'Daffodil'),
--          (N'Camembert'),
--          (N'Neddy'),
--          (N'Smudge'),
--          (N'Molly');
--  INSERT INTO @t2 ([Name])
--      VALUES
--          (N'Daffodil'),
--          (N'Neddy'),
--          (N'Molly'),
--          (N'Spooky');
--  SELECT [Name]
--  FROM @t1
--  INTERSECT
--  SELECT [Name]
--  FROM @t2
--      ORDER BY [Name];

--  CREATE OR ALTER FUNCTION dbo.ProductSales (@CustomerID int)
--  RETURNS TABLE
--  RETURN
--      SELECT C.[Name] AS 'Category', SUM(D.OrderQty) AS 'Quantity'
--          FROM SalesLT.SalesOrderHeader AS H
--              INNER JOIN SalesLT.SalesOrderDetail AS D
--                  ON H.SalesOrderID = D.SalesOrderID
--              INNER JOIN SalesLT.Product AS P
--                  ON D.ProductID = P.ProductID
--              INNER JOIN SalesLT.ProductCategory AS C
--                  ON P.ProductCategoryID = C.ProductCategoryID
--          WHERE H.CustomerID = @CustomerID
--              GROUP BY C.[Name]


--  SELECT C.CustomerID, C.CompanyName, P.Category, P.Quantity
--  FROM SalesLT.Customer AS C
--      CROSS APPLY dbo.ProductSales(C.CustomerID) AS P;


SELECT 
    CompanyName
FROM SalesLT.Customer
Where CustomerID BETWEEN 1 AND 20000
UNION ALL 
SELECT
    CompanyName
FROM SalesLT.Customer
WHERE CustomerID BETWEEN 20000 AND 40000


 DECLARE @t1 AS table
 (Name nvarchar(30) NOT NULL);
 DECLARE @t2 AS table
 ([Name] nvarchar(30) NOT NULL);
 INSERT INTO @t1 ([Name])
     VALUES
         (N'Daffodil'),
         (N'Camembert'),
         (N'Neddy'),
         (N'Smudge'),
         (N'Molly');
 INSERT INTO @t2 ([Name])
     VALUES
         (N'Daffodil'),
         (N'Neddy'),
         (N'Molly'),
         (N'Spooky');
 SELECT [Name]
 FROM @t1
 EXCEPT
 SELECT [Name]
 FROM @t2
     ORDER BY [Name];

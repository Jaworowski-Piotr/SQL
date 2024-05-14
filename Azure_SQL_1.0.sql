SELECT * FROM SalesLT.Customer

SELECT 
    a.City
    , a.ModifiedDate
FROM SalesLT.Address AS a

SELECT 
    p.ProductID 
    , AVG(p.ListPrice) as 'AVG'
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail as soh
    on soh.ProductID = p.ProductID
GROUP BY p.ProductID 


SELECT CustomerID
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID;

SELECT CustomerID, COUNT(*) AS OrderCount
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID;

SELECT 
    soh.CustomerID
    , soh.PurchaseOrderNumber
    , COUNT(*)
FROM SalesLT.SalesOrderHeader as soh
GROUP BY CustomerID, soh.PurchaseOrderNumber

SELECT 
    CustomerID
    , COUNT(*) as [OrderCount]
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(*) > 10


------- Zadania z Lab'a ------- 
 SELECT YEAR(SellStartDate) AS SellStartYear, ProductID, Name
 FROM SalesLT.Product
 ORDER BY SellStartYear;

SELECT 
    soh.SalesOrderID
    , ROUND(soh.Freight, 2) AS FreightCost
    , LOWER(soh.ShipMethod) as ShippingMethod 
    , YEAR(soh.ShipDate) as ShipYear
    , DATENAME(MM,soh.ShipDate) as ShipMonth
    , DAY(soh.ShipDate) as ShipDay
FROM SalesLT.SalesOrderHeader as soh

Select 
    p.Name
    , SUM(sod.LineTotal) as TotalRevenue
FROM SalesLT.Product as p
JOIN SalesLT.SalesOrderDetail as sod ON p.ProductID = sod.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
HAVING SUM(sod.LineTotal) > 20000
ORDER BY TotalRevenue DESC




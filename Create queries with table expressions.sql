-- USE adventureworks
-- GO

-- SELECT 
--     p.ProductID
--     , p.Name
--     , p.ListPrice
-- FROM SalesLT.Product as p
-- ORDER BY p.ProductID


-- CREATE VIEW SalesLT.vProductsRoadBikes AS
-- SELECT 
--     ProductID
--     , Name
--     , ListPrice
-- FROM SalesLT.Product
-- WHERE ProductCategoryID = 6;


-- SELECT
--     DerivedProduct.ProductID, DerivedProduct.Name, DerivedProduct.ListPrice, DerivedProduct.PriceType
-- FROM (Select 
--     ProductID
--     , Name
--     , ListPrice
--     , CASE WHEN ListPrice > 1000  
--         THEN N'HIGH' 
--         ELSE N'NORMAL' 
--         END AS PriceType
-- FROM SalesLT.Product) AS DerivedProduct
-- WHERE DerivedProduct.PriceType = 'HIGH'


-- SELECT 
--     a.AddressLine1
--     , a.City
--     , a.StateProvince
--     , a.CountryRegion
-- FROM SalesLT.Address as a
-- WHERE a.CountryRegion = N'Canada'

-- CREATE VIEW SalesLT.vCustomerFromCanada as 
-- (SELECT 
--     a.AddressLine1
--     , a.City
--     , a.StateProvince
--     , a.CountryRegion
-- FROM SalesLT.Address as a
-- WHERE a.CountryRegion = N'Canada')

-- Select * FROM SalesLT.vCustomerFromCanada 

Select
*
FROM (SELECT 
    p.ProductID
    , p.NAME
    , p.Weight
    , p.ListPrice
    , CASE WHEN p.Weight > 1000 THEN N'Heavy' ELSE N'Light' END as WeightType
FROM SalesLT.Product as p) as DerivedProduct
WHERE 
    -- DerivedProduct.WeightType = 'Heavy'
    -- AND
    DerivedProduct.ListPrice > 2000




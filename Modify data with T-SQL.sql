SELECT * From SalesLT.Product
WHERE 1=0;



CREATE TABLE SalesLT.CallLog(
    CallID INT NOT NULL IDENTITY PRIMARY KEY,
    CallTime DATETIME NOT NULL DEFAULT GETDATE(),
    SalesPerson VARCHAR(256) NOT NULL,
    CustomerID INT NOT NULL REFERENCES SalesLT.Customer(CustomerID),
    PhoneNumber NVARCHAR(50) NOT NULL,
    Notes NVARCHAR(max) NULL
);

SELECT * FROM SalesLT.CallLog

INSERT INTO SalesLT.CallLog
VALUES
('2015-01-01T12:30:00', 'adventure-works\pamela0', 1, '245-555-0173', 'Returning call re: enquiry about delivery');

INSERT INTO SalesLT.CallLog
VALUES
(Default,'adventure-works\david8', 2, '170-555-0127', NULL);

INSERT INTO SalesLT.CallLog (SalesPerson, CustomerID, PhoneNumber)
VALUES  
('adventure-works\jillian0', 3, '279-555-0130');

INSERT INTO SalesLT.CallLog
VALUES
(DATEADD(mi,-2, GETDATE()), 'adventure-works\jillian0', 4, '710-555-0173', NULL),
(DEFAULT, 'adventure-works\shu0', 5, '828-555-0186', 'Called to arrange deliver of order 10987');


INSERT INTO SalesLT.CallLog (SalesPerson, CustomerID, PhoneNumber, Notes)
SELECT SalesPerson, CustomerID, Phone, 'Sales promotion call'
FROM SalesLT.Customer
WHERE CompanyName = 'Big-Time Bike Store';



 INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
 VALUES
 ('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE());

 SELECT SCOPE_IDENTITY();

 SELECT * FROM SalesLT.Product
 WHERE ProductID = SCOPE_IDENTITY();


INSERT INTO SalesLT.ProductCategory (ParentProductCategoryID, Name)
 VALUES
 (4, 'Bells and Horns');

 INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
 VALUES
 ('Bicycle Bell', 'BB-RING', 2.47, 4.99, IDENT_CURRENT('SalesLT.ProductCategory'), GETDATE()),
 ('Bicycle Horn', 'BH-PARP', 1.29, 3.75, IDENT_CURRENT('SalesLT.ProductCategory'), GETDATE());

 SELECT c.Name As Category, p.Name AS Product
 FROM SalesLT.Product AS p
 JOIN SalesLT.ProductCategory as c
     ON p.ProductCategoryID = c.ProductCategoryID
 WHERE p.ProductCategoryID = IDENT_CURRENT('SalesLT.ProductCategory');


UPDATE SalesLT.Product
 SET ListPrice = ListPrice * 1.1
 WHERE ProductCategoryID =
     (SELECT ProductCategoryID
      FROM SalesLT.ProductCategory
      WHERE Name = 'Bells and Horns');


UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductCategoryID = 37
AND ProductNumber <> 'LT-L123';


DELETE FROM SalesLT.Product
WHERE ProductCategoryID =
     (SELECT ProductCategoryID
      FROM SalesLT.ProductCategory
      WHERE Name = 'Bells and Horns');

DELETE FROM SalesLT.ProductCategory
WHERE ProductCategoryID =
     (SELECT ProductCategoryID
      FROM SalesLT.ProductCategory
      WHERE Name = 'Bells and Horns');

      
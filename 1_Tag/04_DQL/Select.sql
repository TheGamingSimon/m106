USE WideWorldImporters;
GO

SELECT * FROM Sales.Customers;
SELECT CustomerName, DeliveryAddressLine1 FROM Sales.Customers;

SELECT CustomerName, PhoneNumber AS 'Telefonnummer'
FROM Sales.Customers;

SELECT CountryName + ' (' + ISOAlpha3Code + ')' AS 'Land'
FROM Application.Countries ORDER BY CountryName DESC;

SELECT DISTINCT Continent FROM Application.Countries;

SELECT TOP 3 * FROM Sales.Orders ORDER BY OrderDate ASC;
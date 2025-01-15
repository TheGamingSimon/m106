USE WideWorldImporters;

SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 10 THEN 'Die Bestellmenge ist groesser als 10'
    WHEN Quantity = 10 THEN 'Die Bestellmenge ist 10'
    ELSE 'Die Bestellmenge ist kleiner als 10'
END AS QuantityText
FROM Sales.OrderLines;
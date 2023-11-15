/******************************************/

--Aggregatfunktionen

/******************************************/

-- grundsaetzlich 5 verschiedene Funktionen

SELECT
SUM(Freight) AS Summe,
MIN(Freight) AS Minimum,
MAX(Freight) AS Maximum,
AVG(Freight) AS Durchschnitt,
COUNT(ShippedDate) AS ZaehleSpalte, COUNT(*) as ZaehleAlles
From Orders

SELECT SUM(Freight) / COUNT(*) FROM Orders

SELECT CustomerID, SUM(Freight) FROM Orders

-- Loesung ueber GROUP BY:

-- Freight Summe pro CustomerID
SELECT CustomerID, Freight FROM Orders
ORDER BY CustomerID

SELECT CustomerID, SUM(Freight) AS Summe FROM Orders
GROUP BY CustomerID

-- Freight Summe pro ShipCountry
SELECT ShipCountry, SUM(Freight) FROM Orders
GROUP BY ShipCountry

-- Quantity Summe pro ProductID:
SELECT ProductID, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
GROUP BY ProductID

-- Quantity Summe pro ProductName:
SELECT ProductName, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
GROUP BY ProductName

-- Quantity Summe pro ProductName fuer Produkte der Kategorien 1-4:
SELECT ProductName, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE CategoryID IN (1,2,3,4)
GROUP BY ProductName
-- HAVING
ORDER BY SummeStueckzahl DESC

--Verkaufte Stueckzahlen pro Produkt, aber nur ueber 1000
--Geht so nicht:
SELECT ProductName as Produkt, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE SUM(Quantity) > 1000
GROUP BY ProductName
ORDER BY SummeStueckzahl DESC


-- HAVING funktioniert 1zu1 wie WHERE, kann aber gruppierte/aggregierte Werte nachtraeglich filtern
SELECT ProductName as Produkt, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
--WHERE SUM(Quantity) > 1000
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY SummeStueckzahl DESC
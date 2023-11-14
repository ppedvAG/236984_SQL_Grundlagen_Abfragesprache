-- WHERE Uebungen

--1. Alle Contactnames die als Title "Owner" haben (Tabelle Customers)
SELECT ContactName FROM Customers
WHERE ContactTitle LIKE '%Owner%'

SELECT ContactName FROM Customers  -- = 17 Rows
WHERE ContactTitle = 'Owner'

--2. Alle Order Details die ProductID 43 bestellt haben = 28 Rows
SELECT * FROM [Order Details]
WHERE ProductID = 43

--3. Alle Kunden aus Paris, Berlin, Madrid 
SELECT * FROM Customers
WHERE City IN ('Paris', 'Berlin', 'Madrid')

--4. Alle Produkte der Category "Beverages" (Tabelle Categories)
SELECT ProductName FROM Categories JOIN
Products ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName = 'Beverages'


--Uebungen
--Merke: ALLES was im SELECT steht, und KEIN Aggregate --> Copy Paste ins Group By

--5. Bei welchem Produkt (Productname) würden wir den größten Umsatz machen, wenn 
--wir sofort alle verfügbaren Einheiten (UnitsInStock) verkaufen würden?
-- Umsatz = UnitsInStock * UnitPrice
-- Umsatz sortieren absteigend
SELECT TOP 1 ProductName, UnitsInStock * UnitPrice as Umsatz FROM Products
ORDER BY Umsatz DESC

--6. Gab es Bestellungen (OrderID) an Wochenendtagen (OrderDate)?
SELECT OrderID, DATEPART(WEEKDAY, OrderDate) as Wochentag FROM Orders
ORDER BY Wochentag DESC

SELECT * FROM Orders
WHERE DATEPART(WEEKDAY, OrderDate) IN(6,7)

-- SELECT
-- SUM(Freight) AS Summe,
-- MIN(Freight) AS Minimum,
-- MAX(Freight) AS Maximum,
-- AVG(Freight) AS Durchschnitt,
-- COUNT(ShippedDate) AS ZaehleSpalte, COUNT(*) as ZaehleAlles
-- From Orders

--7. Verkaufte Stueckzahlen (Quantity) pro ProduktKategorie (CategoryName) (8 Ergebniszeilen)
-- SELECT * FROM TabellaA JOIN TabelleB ON TabelleA.Spalte = TabelleB.Spalte
SELECT CategoryName, SUM(Quantity) FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName

--8. Wieviele Bestellungen hat jeder Mitarbeiter bearbeitet? (9 Ergebniszeilen)
-- Tables: Employees - Orders
SELECT LastName, COUNT(OrderID), FirstName FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY LastName, FirstName
ORDER BY 2 DESC

--9. Haben wir Produkteinheiten im Lager (UnitsInStock), die aber nicht mehr verkauft werden 
-- (Discontinued)? Wenn ja, wieviel „Geld“ liegt dort noch im Lager?
SELECT ProductName, UnitsInStock * UnitPrice as Wert FROM Products
WHERE Discontinued = 1 AND UnitsInStock != 0

--10. Was war das meistverkaufte Produkt im Jahr 1998 (Productname)? Wieviel Stück (Quantity)?
SELECT TOP 1 ProductName, SUM(Quantity) as Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998
GROUP BY ProductName
ORDER BY Verkaufsmenge DESC

--11. In welcher Stadt (City) waren „Wimmers gute Semmelknödel“ am beliebtesten (Quantity)?
SELECT TOP 1 City, SUM(Quantity) AS Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE ProductName = 'Wimmers gute Semmelknödel'
GROUP BY City
ORDER BY Verkaufsmenge DESC

--12. Welcher Spediteur (Shippers) war durchschnittlich am günstigsten? (Freight)
-- Tables: Shippers - Orders Vernüpfung Orders.ShipVia = Shippers.ShipperID
SELECT TOP 1 CompanyName, AVG(Freight) as AvgFreight FROM Orders 
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName
ORDER BY AvgFreight
/*********************************************/

-- Joins - "verbinden" Datensätze von Tabellen miteinander ins Selbe Ergebnisfenster

/*********************************************/

SELECT * FROM Orders
SELECT * FROM Customers

-- JOIN Syntax

/*
	SELECT Spalten FROM TabelleA JOIN TabelleB ON TabelleA.Spalte = TabelleB.Spalte
*/

SELECT * FROM Orders JOIN Customers ON Orders.CustomerID = Customers.CustomerID

SELECT * FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT Customers.CompanyName, Customers.ContactName, Orders.* FROM Customers JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID

----------------------------------------

SELECT CompanyName, Orders.CustomerID FROM Orders JOIN Customers
ON Orders.CustomerID = Customers.CustomerID

----------------------------------------

SELECT Orders.CustomerID, Customers.CustomerID FROM Orders JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID

-- Tabellen: Customers | Employees | Orders
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID


-- Übungen:
-- 1. Alle Bestellungen (Orders) die der Mitarbeiter "King" (LastName in Employees)
-- bearbeitet hat
SELECT OrderID, LastName FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'King'

-- 2. Alle Bestellungen (Orders) aus Frankreich (Customers), deren Lieferkosten
-- (Freight) über 300 sind
SELECT * FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Country = 'France' AND Freight > 300

-- 3. Welche verschiedenen Produkte (ProductName in Products) wurden in Austria
-- verkauft?
-- Tables: Customers --> Orders --> Order Details --> Products
SELECT CompanyName, ProductName FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE Country = 'Austria'

/******************************************************/

-- OUTER Joins

/******************************************************/

-- LEFT/RIGHT Join = Zeigt Tabelle A und B vollständig an (zusätzlich zur Schnittmenge)
SELECT * FROM Customers
LEFT JOIN Orders ON Orders.CustomerID = Customers.CustomerID

-- FULL OUTER JOIN = Left + Right gleichzeitig
SELECT * FROM Customers
FULL OUTER JOIN Orders ON Orders.CustomerID = Customers.CustomerID

-- "SELF JOIN" (=inner join)

-- Wer reportet an wen? (Name Mitarbeiter & Name vom Vorgesetzten)
SELECT Mitarbeiter.EmployeeID, Mitarbeiter.LastName,
Vorgesetzte.EmployeeID, Vorgesetzte.LastName FROM Employees AS Mitarbeiter
LEFT JOIN Employees AS Vorgesetzte ON Mitarbeiter.EmployeeID = Vorgesetzte.ReportsTo
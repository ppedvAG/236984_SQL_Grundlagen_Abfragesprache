--1. Hat „Andrew Fuller“ (Employee) schonmal Produkte der Kategorie 
--„Seafood“ (Categories) verkauft?
--Wenn ja, wieviel Lieferkosten sind 
--dabei insgesamt entstanden (Freight)?
-- Bonus: Das ganze mit Temporaere Tabellen machen
SELECT DISTINCT SUM(Freight) as Lieferkosten 
INTO #TempTable
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Employees.LastName = 'Fuller' AND Categories.CategoryName = 'Seafood'

SELECT * FROM #TempTable

--2. Ist der Spediteur „Speedy Express“ 
--über die Jahre durchschnittlich teurer geworden? (Freight pro Jahr)
SELECT CompanyName, DATEPART(YEAR, OrderDate) as Geschaeftsjahr, AVG(Freight) AS AvgFreight
FROM Orders JOIN Shippers
ON Orders.ShipVia = Shippers.ShipperID
WHERE CompanyName = 'Speedy Express'
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)


--3. Erstellen Sie einen Bericht, der die Gesamtzahl der 
--Bestellungen nach Kunde seit dem 31. Dezember 1996 anzeigt. 
--Der Bericht sollte nur Zeilen zurückgeben, 
--für die die Gesamtzahl der Aufträge größer als 15 ist (5 Zeilen)
--Tables: Orders
SELECT CustomerID, COUNT(OrderID) FROM Orders
WHERE OrderDate > '19961231'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15
ORDER BY 2


--4. Trage dich selber in die Tabelle ein (Employees). Bei den folgenden Spalten: 
--LastName, FirstName, Title, TitleOfCourtesy, BirthDate, 
--HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo

-- Bonus: Aendere die Werte danach um, in eine Person die frei erfunden ist


--5. Schreiben Sie eine Abfrage, um eine Produktliste 
--(ID, Name, Stückpreis) mit einem überdurchschnittlichen Preis zu erhalten.
SELECT DISTINCT ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice

-- 6. Jahrweiser Vergleich unserer 3. Spediteure: (Shippers Tabelle): 
-- Lieferkosten (Freight) gesamt, Durchschnitt (freight)
-- pro Lieferung und Anzahl an Lieferungen
-- Tables: Orders - Shippers
-- Aggregate: SUM, AVG, COUNT
-- DATEPART() benoetigt
/*
	Ergebnis in etwa so:
	SpediteurName, Geschäftsjahr, FreightGesamt, FreightAvg, AnzBestellungen
	Sped 1		 ,1996			, xy		   , xy		   , xy
	Sped 1		 ,1996			, xy		   , xy		   , xy
	Sped 1		 ,1996			, xy		   , xy		   , xy
	usw....
*/
SELECT CompanyName,
DATEPART(YEAR, OrderDate) as Geschaeftsjahr,
SUM(Freight) AS FreightGesamt,
AVG(Freight) AS FreightAvg,
COUNT(*) AS AnzBestellungen
FROM Shippers
JOIN Orders ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)
ORDER BY Geschaeftsjahr, FreightAvg

-- 7. Wieviel Umsatz haben wir in jedem Geschäftsjahr insgesamt gemacht?
-- Benoetigt: SUM(SummeBestPosi)
-- View: vRechnungsDaten
SELECT DATEPART(YEAR, OrderDate) AS Geschaeftsjahr,
SUM(SummeBestPosi) AS GesamtUmsatz FROM vRechnungsDaten
GROUP BY DATEPART(YEAR, OrderDate)
ORDER BY 1

-- 8. Wieviel Umsatz haben wir in Q1 1998 mit Kunden aus den USA gemacht?
SELECT SUM(SummeBestPosi) AS GesamtUmsatz FROM vRechnungsDaten
WHERE Country = 'USA' AND DATEPART(YEAR, OrderDate) = 1998 AND DATEPART(QUARTER, OrderDate) = 1

-- 9. Was war das meistverkaufte Produkt (ProductName) von Mitarbeiter "Buchanan"? 
--	  Wieviel Stück insgesamt?
-- Tables: Employees - Orders - [Order Details] - Products


--10. Wieviele Bestellungen kamen aus Spain (Customers) in Quartal 2 1997?
--   Sind es mehr oder weniger als aus Frankreich? (2. Abfrage)

--11. Hatten wir Bestellungen, die wir zu spaet ausgeliefert haben? Wenn 
-- ja, welche OrderIDs waren das und wieviele Tage
-- waren wir zu spaet dran? (Verzoegerung = Unterschied zwischen Shipped 
-- & Required Date in Orders) Tipp: DATEDIFF & ISNULL
-- ISNULL prueft auf Null Werte und ersetzt diese wenn gewuenscht
-- SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax, Fax FROM Customers
/* 37
OrderID, "TageZuSpaet"
OrderID, "TageZuSpaet"
OrderID, "TageZuSpaet"
usw...
*/
SELECT OrderID, DATEDIFF(DAY, RequiredDate, ISNULL(ShippedDate, GETDATE())) as TageVerzoegerung FROM Orders
WHERE DATEDIFF(DAY, RequiredDate, ISNULL(ShippedDate, GETDATE())) > 0
ORDER BY TageVerzoegerung DESC

SELECT * FROM Orders WHERE OrderID = 10777
-- Lieferungen die bis heute nicht geliefert wurden mit ISNULL "behandeln"

--12. Liste der Kategorienamen und Beschreibungen aller Kategorien, die mit "Co" beginnen, 
--aus der Tabelle "Kategorien" auswählen.

--13. Wählen Sie aus der Tabelle der Suppliers (CompanyName, City, Country, Postalcode) die das Wort "rue" in 
--ihrer Adresse enthalten. Die Liste sollte 
--alphabetisch nach Firmennamen geordnet sein.



--14. Erstelle eine Procedure, der man als Parameter eine OrderID übergeben kann.
--Bei Ausführung soll der Rechnungsbetrag dieser Order ausgegeben werden 
-- SUM(Quantity * UnitPrice + Freight) = RechnungsSumme.

CREATE PROCEDURE sp_RechnungsSumme @OrderID INT
AS
SELECT Orders.OrderID, SUM(Quantity * UnitPrice + Freight) AS RechnungsSumme
FROM Orders JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID = @OrderID
GROUP BY Orders.OrderID

EXEC sp_RechnungsSumme 10250



/******************************************************/

-- UNION(ALL) - verbindet Abfrageergebnisse "vertikal" in eine Tabelle

/******************************************************/

SELECT 100, 5
UNION
SELECT 500, 10

-- WICHTIG!: Spaltenanzahl muss identisch sein:
SELECT 100
UNION
SELECT 500, 10

-- Datentypen m�ssen Kompatibel sein:

-- UNION hat "eingebautes" DISTINCT:
SELECT 100
UNION
SELECT 100

-- Ohne DISTINCT mit UNION ALL:
SELECT 100
UNION ALL
SELECT 100

-- ORDER BY immer nach der letzten UNION Abfrage
SELECT 50
UNION 
SELECT 100
UNION
SELECT 70
ORDER BY 1 

/******************************************************/

-- INTERSECT/EXCEPT - vergleicht Abfrageergebnisse von mehr als einer Abfrage

/******************************************************/

-- INTERSECT = Schnittmenge (gleiche Datens�tze) zweier Abfragen
SELECT * FROM Customers -- => 91 Rows
INTERSECT -- Ich hole mir die �bereinstimmungen beider Abfragen raus & gebe sie zur�ck
SELECT * FROM Customers -- => 11 Rows
WHERE Country = 'Germany'

-- EXCEPT = "Zeige mir alle Datens�tze aus Abfrage 1, die NICHT ebenfalls in Abfrage 2 auftauchen"
SELECT * FROM Customers
EXCEPT
SELECT * FROM Customers
WHERE Country = 'Germany'

-- => w�re genau das selbe
SELECT * FROM Customers
WHERE Country != 'Germany'

-- �bung
-- Welche Produkte haben wir nicht NICHT in Austria verkauft
SELECT ProductName FROM Products
EXCEPT
SELECT DISTINCT ProductName FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE Country = 'Austria'


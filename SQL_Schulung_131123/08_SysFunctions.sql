/******************************************/

--Datums- & Zeitfunktionen

/******************************************/

SELECT OrderDate FROM Orders

-- Akutelle Systemzeit:
SELECT GETDATE()

SELECT YEAR(OrderDate) as Jahr, MONTH(OrderDate) as Monat, DAY(OrderDate) as Tag, OrderDate FROM Orders

-- "Zieht" ein gewuenschtes Intervall aus einem Datum
SELECT
DATEPART(YEAR, OrderDate) AS Jahr,
DATEPART(QUARTER, OrderDate) AS Quartal,
DATEPART(WEEK, OrderDate) as KW,
DATEPART(WEEKDAY, OrderDate) AS Wochentag,
DATEPART(HOUR, OrderDate) as Stunde
FROM Orders

SELECT DATEPART(YEAR, OrderDate) as Jahr FROM Orders

-- Zieht den IntervallNamen aus einem Datum
SELECT DATENAME(MONTH, OrderDate), DATENAME(WEEKDAY, OrderDate), 
DATEPART(WEEKDAY, OrderDate), OrderDate FROM Orders

-- Intervall zu einem Datum addieren/subtrahieren
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- Differenz in Intervall xy zwischen 2 Datum
SELECT DATEDIFF(DAY, '20050213', GETDATE())
SELECT DATEDIFF(YEAR, OrderDate, GETDATE()), OrderDate FROM Orders

SELECT * FROM Orders
WHERE OrderDate >= DATEADD(DAY, -31, GETDATE())

/******************************************/

--StringFunctions

/******************************************/

-- CONCAT: Fuegt Strings in einer Spalte zusammen

SELECT CONCAT(FirstName, ' ', LastName, ' ', 100) as GanzerName FROM Employees
SELECT * FROM Employees

SELECT FirstName + ' ' + LastName + ' 100' as GanzerName FROM Employees

/******************************************/

-- OtherFunctions

/******************************************/

-- CAST oder CONVERT, wandeln Datentypen in der ausgabe um

-- konventierung von datetime => date
SELECT CAST(OrderDate as date) FROM Orders
SELECT OrderDate from Orders

SELECT CONVERT(date, OrderDate) FROM Orders

-- ISNULL prueft auf Null Werte und ersetzt diese wenn gewuenscht
SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax, Fax FROM Customers
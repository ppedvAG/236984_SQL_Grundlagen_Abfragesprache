/******************************************/

--Datums- & Zeitfunktionen

/******************************************/

SELECT OrderDate FROM Orders

-- Akutelle Systemzeit:
SELECT GETDATE()

SELECT YEAR(OrderDate), MONTH(OrderDate), DAY(OrderDate), OrderDate FROM Orders

-- "Zieht" ein gewuenschtes Intervall aus einem Datum
SELECT
DATEPART(YEAR, OrderDate) AS Jahr,
DATEPART(QUARTER, OrderDate) AS Quartal,
DATEPART(WEEK, OrderDate) as KW,
DATEPART(WEEKDAY, OrderDate) AS Wochentag,
DATEPART(HOUR, OrderDate) as Stunde
FROM Orders

-- Zieht den IntervallNamen aus einem Datum
SELECT DATENAME(MONTH, OrderDate), DATENAME(WEEKDAY, OrderDate), DATEPART(WEEKDAY, OrderDate), OrderDate FROM Orders

-- Intervall zu einem Datum addieren/subtrahieren
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- Differenz in Intervall xy zwischen 2 Datum
SELECT DATEDIFF(DAY, '20050213', GETDATE())
SELECT DATEDIFF(YEAR, OrderDate, GETDATE()), OrderDate FROM Orders

SELECT * FROM Orders
WHERE OrderDate >= DATEADD(DAY, -31, GETDATE())
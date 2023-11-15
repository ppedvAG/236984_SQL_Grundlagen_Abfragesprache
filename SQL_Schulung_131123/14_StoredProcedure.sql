/*******************************************/

-- Stored Procedures / gespeicherte Prozeduren

/*******************************************/

/*
	- Sind gespeicherte SQL Anweisungen (nicht nur SELECT, sondern auch alles andere)
	- Arbeiten mit Variablen
	- Werden als DB Objekt auf der DB gespeichert
	- Praktisch zum "automatisieren" von Code
	- Prozeduren verwenden ihren QueryPlan jedes mal wieder
*/

CREATE PROCEDURE spRechnungsByOrderID @OrderID INT, @OrderIDZwei INT
AS
SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID


CREATE PROCEDURE spRechnungsByOrderIDZwei @OrderID INT, @OrderIDZwei INT
AS
SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID
SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderIDZwei

-- Procedure ausfuehren
EXEC spRechnungsByOrderID 10248

EXEC spRechnungsByOrderIDZwei 10248, 10249


CREATE PROCEDURE spNewCustomerNeu
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(30), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)

EXEC spNewCustomerNeu ALDIS, 'ppedv AG', 'Germany', Burghausen
EXEC spNewCustomerNeu LIDLI, 'Lidl GmbH', 'Germany', Burghausen

SELECT * FROM Customers
WHERE CustomerID = 'LIDLI'


-- Default Werte
CREATE PROCEDURE spKundenNachLandCityNeu @Country varchar(50) = 'Germany', @City varchar(50) = 'Berlin'
AS
SELECT * FROM Customers WHERE Country = @Country AND City = @City

EXEC spKundenNachLandCityNeu France, Paris


/*******************************************/

-- Variablen allgemein

/*******************************************/

DECLARE @OrderID int = 10250, @var2 int, @var3 int

SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID

SET @OrderID = 10251

SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID
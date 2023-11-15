/*************************************/

-- CREATE / ALTER / DROP - DDL (Data Definition Language)

/*************************************/

-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle

CREATE TABLE PurchasingOrders 
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	OrderDate date NOT NULL,
	ProductID int NOT NULL,
)

SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrder und Products anlegen über ProductID:
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzufuegen zu bestehendem Table:
ALTER TABLE PurchasingOrders
ADD TestDaten INT

-- Spalte aus der bestehenden Table loeschen:
ALTER TABLE PurchasingOrders
DROP COLUMN NeueSpalte

/*************************************/

-- INSERT - Hinzufügen von Datensätzen in bestehender Table

/*************************************/

-- Alle Spalten befuellen:
INSERT INTO PurchasingOrders
VALUES ('20231115', 5)

-- Explizit einzelne palten befuellen:
INSERT INTO PurchasingOrders
(OrderDate, ProductID) VALUES ('20231115', 3)

INSERT INTO PurchasingOrders
(OrderDate, ProductID) VALUES ('20231115', 2)

SELECT * FROM PurchasingOrders

-- Ergebnis einer SELECT-Abfrage können direkt Inserted werden (Wenn Spaltenanzahl passt
-- & Datentypen kompatibel)
INSERT INTO PurchasingOrders
SELECT GETDATE(), 3, NULL


/*************************************/

-- DELETE - Löschen von Datensätzen in einem bestehendem Table

/*************************************/

SELECT * FROM PurchasingOrders

-- Aufpassen! Ohne WHERE Filter werden ALLE Datensaetze geloescht!
DELETE FROM PurchasingOrders
WHERE ID = 7

-- Primaer-/Fremdschluesselbeziehungen verhindern das loeschen von Datensaetzen, wenn andere Datensaetze
-- sonst "ins Leere laufen wuerden"

DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

/*************************************/

-- UPDATE - Ändern von Spaltenwerten in einem vorhandenden Datensatz

/*************************************/

SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 8
WHERE ID = 1

-- "Loeschen" von Werten: SET = NULL
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 1


--4. Trage dich selber in die Tabelle ein (Employees). Bei den folgenden Spalten: 
--LastName, FirstName, Title, TitleOfCourtesy, BirthDate, 
--HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo

-- Bonus: Aendere die Werte danach um, in eine Person die frei erfunden ist




/*************************************/

-- CONSTRAINTS in Tabellen

/*************************************/

ALTER TABLE PurchasingOrders
ADD CONSTRAINT CHK_OrderDate CHECK (OrderDate <= GETDATE())


/*******************************************/

-- Transactions

/*******************************************/

BEGIN TRANSACTION

UPDATE PurchasingOrders
SET TestDaten = 5

COMMIT -- =>
ROLLBACK

SELECT * FROM PurchasingOrders


/*
	Eröffnet Kommentarblock
	über mehrere Zeilen
	bis geschlossen wird
*/

-- einzeiliger Kommentar "--"

-- Richtige Datenbank ansprechen (per Drowdown Menü oben rechts oder per USE Datenbankname Befehl)
USE Northwind

-- Datenbank loeschen
DROP DATABASE Northwind

-- "*" bedeutet ALLE Spalten die vorhanden sind
SELECT * FROM Customers

SELECT * FROM Orders

-- Einzelne Spalten namentlich aufrufen und mit "," trennen
SELECT Country, City FROM Customers

-- SQL ist nicht case sensitive
select coUntRy, ciTy FRoM Customers

-- "Custom" Ausgabe in SQL
SELECT 100

-- Strings/Charakterdatentypen müssen in einzelnen Hochkommas geschrieben werden ''
SELECT 100, 5, 'Hallo' 

SELECT Freight, Freight + 10 FROM Orders

-- Namen neu vergeben über Alias AS:
SELECT Freight, Freight + 10 AS LieferkostenPlus10 FROM Orders

-- Funktionieren auch für Tabellennamen (später nützlich)
SELECT * FROM Customers AS cus

/*
	1. Alle Spalten von der Tabelle Shippers

	2. Nur die Spalte "Description" von der Tabelle "Categories"

	3. Nur die Spalte "OrderDate" von der Tabelle "Orders"
*/

SELECT * FROM Shippers

SELECT Description FROM Categories

SELECT OrderDate FROM Orders

/*********************************************/

-- ORDER BY - Sortiert Ergebnismenge - steht syntaktisch immer am Ende der Abfrage

/*********************************************/

SELECT * FROM Customers
ORDER BY Country DESC  -- DESC = descending = absteigend

SELECT * FROM Customers

-- Es kann nach mehreren Spalten sortiert werden:
SELECT CompanyName, Country, City FROM Customers
ORDER BY Country, City DESC

/*********************************************/

-- TOP X - werden nur die "obersten" X Zeilen ausgegeben

/*********************************************/

SELECT TOP 10 * FROM Customers

SELECT TOP 10 Country FROM Customers

-- Die 20 Bestellungen mit den kleinsten Freight Werten:
SELECT TOP 20 * FROM Orders
ORDER BY Freight

-- Die 20 Bestellungen mit den größten Freight Werten:
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

-- SELECT BOT X gibt es nicht, wir drehen die Sortierung einfach mit ORDER BY um

SELECT * FROM Orders

SELECT TOP 50 PERCENT * FROM Orders


/*********************************************/

-- DISTINCT - "filtert" Duplikate Ergebniszeilen

/*********************************************/

SELECT Country FROM Customers

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Country, City FROM Customers
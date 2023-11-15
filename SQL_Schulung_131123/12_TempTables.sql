/******************************************/

-- Temporäre Tabellen / Temp Tables / #Tables

/******************************************/

/*
	- SELECT INTO #TableName => Ergebnisse werden in eine Temporäre Tabelle geschrieben
	- existiert nur innerhalb meiner Session (Skriptfenster / Query)
	- werden in SystemDB tempDB angelegt
	- Ergebnisse werden nur einmal generiert --> TempTables sehr schnell aber nicht aktuell
	- mit einem # = "lokal"
	- mit zwei ## = "global"
*/

-- Erstellen
SELECT * 
INTO #TempTable
FROM Customers
WHERE Country = 'Germany'

-- Temporaere Tabelle aufrufen
SELECT * FROM #TempTable

-- manuell loeschen
DROP TABLE #TempTable

-- globale Temp Table:
SELECT *
INTO ##TempTable
FROM Customers
WHERE Country = 'Germany'
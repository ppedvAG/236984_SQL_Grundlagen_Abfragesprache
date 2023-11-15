/*******************************************/

-- Subqueries / Unterabfragen / nested queries

/*******************************************/

/*
	- Muessen eigenstaendig fehlerfrei ausfuehrbar sein!
	- Koennen prinzipiell ueberall in eine Abfrage eingebaut werden (wenn es Sinn macht)
	- Abfragen werden "von innen nach außen" der Reihe nach ausgefuehrt
*/

-- Zeige mir alle Orders, deren Freight Wert ueber dem Durchschnitt liegt

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

-- Tabelle auch als Subquerie moeglich
SELECT SUM(Umsatz) FROM (SELECT CompanyName FROM Customers) as UnternehmensName

-- Mehrere Werte aus einer Subquery im WHERE moeglich, wenn mit IN kombiniert
SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)
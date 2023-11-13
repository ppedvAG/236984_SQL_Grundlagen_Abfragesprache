/*********************************************/

-- LIKE - im WHERE statt boolschen Vergleichsoperatoren; Filtert nach "ungenauen" Eingaben

/*********************************************/

SELECT * FROM Customers
WHERE ContactTitle LIKE '%Manager%'

-- "Wildcards" - Platzhaltersymbole

-- "%" = egal welche Symbole, egal wieviele davon
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE 'B%'

SELECT CompanyName FROM Customers
WHERE CompanyName LIKE 'Berg%'

-- "_" egal welches Symbol, aber nur EINS
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE 'B_r%'

SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_r%'

-- "[]" = alle Symbole in den Klammern gültig, an dieser EINEN Stelle
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[012345]%'

SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '[ABCD]%'

-- [^] => "nicht fall"
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '[^ABCD]%'

-- [x-y]
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0-5]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '13%'

-- Sonderfälle = %-Fall
SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

-- = Hochkomma Fall
SELECT * FROM Customers
WHERE CompanyName LIKE '% '' %'
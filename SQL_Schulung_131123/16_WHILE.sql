/*******************************************/

-- WHILE - leitet eine Schleifenanweisung ein

/*******************************************/

-- WHILE = Eine Schleife
DECLARE @Counter INT = 0

WHILE @Counter <= 5
BEGIN
SELECT 'Hallo'
SET @Counter = @Counter + 1
END

-- Endlosschleife, aufpassen auf den Computer
WHILE 1=1
BEGIN
SELECT 'Hallo!'
END
/*
	Datentypen in SQL: 3 große Gruppen

	Charakter/String Datentypen:
	char(10) = Hallo --> 'Hallo     ' = 10 Byte Speicherplatz => 1 Character = 8 Bit
	nchar() = 1 Character = 16 Bit => 2 Byte
	varchar(10) = Hallo --> 'Hallo' = 5 Byte Speicherplatz => 1 Character = 8 Bit = 1 Byte
	nvarchar() = 1 Character = 16 Bit => 2 Byte
	binary = Binärstring

	Legacy: text --> mittlerweile VARCHAR(MAX) = bis zu 2GB groß
	varchar(8000) maximum
	nvarchar(4000)


	Numerische:
	tinyint = 8 bit = bis 255
	smallint = 16 bit = 32k
	int = 32 bit = 2,14 Mrd
	bigint 64 bit = .....

	bit = 1 oder 0

	decimal(x,y) = x Ziffern sind gesamt, davon sind y Nachkommastellen
	decimal(10, 2) = 10 Ziffern sind es insgesamt, davon sind 2 Nachkommastellen
	float
	money

	Datum/Zeit:
	time = 00h 00m 00s
	date = YYYY/MM/DD
	datetime = date + time bis in MS (Millisekunden Bereich)
	datetime2 = bis in NS (Nanosekunden) Bereich
	smalldatetime = präzise bis Sekunden Bereich => YYYY/MM/DD 00h 00m 00s

	Andere:
	XML
	JSON
	geometry
	geography
*/
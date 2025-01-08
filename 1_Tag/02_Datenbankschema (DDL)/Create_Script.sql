-- Datenbank erstellen
USE master;
CREATE DATABASE m106;
GO

-- Schema in der Datenbank erstellen
USE m106;
GO
CREATE SCHEMA verkauf;
GO

-- Tabelle kunden im Schema verkauf erstellen
CREATE TABLE verkauf.kunden (
    kundenid INT IDENTITY(1,1),
    vorname VARCHAR(30),
    nachname VARCHAR(30)
);
-- Lege zum Vergleich dieselbe Tabelle im Standardschema an

-- Tabelle bestellungen im Schema verkauf erstellen
CREATE TABLE verkauf.bestellungen (
    bestellid INT IDENTITY(1,1),
    bestelldatum DATE,
    kundenid INT
);

-- Aufruf der gespeicherten Prozedur sp_columns
EXEC sp_columns @table_name = N'kunden',  @table_owner = N'verkauf'; 

-- neue Spalte bestellwert hinzufügen
ALTER TABLE verkauf.bestellungen ADD bestellwert DECIMAL(10,2);

EXEC sp_columns @table_name = N'bestellungen',  @table_owner = N'verkauf'; 

EXEC sp_rename 'verkauf.bestellungen.bestellwert', 'bestellbetrag', 'COLUMN';

-- Länge der Spalte vornamen auf 50 ändern
ALTER TABLE verkauf.kunden ALTER COLUMN vorname VARCHAR(50);

-- Datentyp der Spalte bestelldatum zu DATETIME ändern
ALTER TABLE verkauf.bestellungen ALTER COLUMN bestelldatum DATETIME;

-- Spalte bestellbetrag aus der Tabelle löschen
ALTER TABLE verkauf.bestellungen DROP column bestellbetrag;

-- Tabelle bestellungen im Schema verkauf löschen
DROP TABLE verkauf.bestellungen;

CREATE TABLE verkauf.bestellungen(
    bestellid INT IDENTITY(1,1),
    bestelldatum DATETIME,
    kundenid INT
);

-- Gesamten Inhalt der Tabelle bestellungen löschen
TRUNCATE TABLE verkauf.bestellungen;
-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen:

use ProjektDB

-- ===========
-- Gruppierung
-- ===========

-- Aufgabe 4.1
--
-- Welche verschiedenen Aufgaben üben die Mitarbeiter 
-- der Firma aus? Nutzen Sie eine Gruppierung.
--
--      aufgabe
--      NULL
--      Gruppenleiter
--      Projektleiter
--      Sachbearbeiter

select aufgabe
from Arbeit
group by aufgabe



-- Aufgabe 4.2
-- 
-- Ändern Sie Ihre Lösung aus 3.1 und verwenden Sie DISTINCT 
-- in Ihrer Abfrage. Welche Unterschiede sehen Sie?
--
--      aufgabe
--      NULL
--      Gruppenleiter
--      Projektleiter
--      Sachbearbeiter

SELECT DISTINCT aufgabe
FROM Arbeit



-- ==================
-- Aggregatfunktionen
-- ==================

-- Aufgabe 4.3
--
-- Nennen Sie die kleinste Personalnummer der Mitarbeiter.
--
--      minimum
--      2581

select min(id) as Minimum
from Mitarbeiter



-- Aufgabe 4.4
--
-- Berechnen Sie die Summe der finanziellen Mittel aller Projekte.
--
--      summe
--      655000,00

select sum(mittel) as Summe
from Projekt


-- Aufgabe 4.5
--
-- Berechnen Sie den arithmetischen Mittelwert der Geldbeträge, 
-- die höher als 92336,10 Euro sind.
--
--      durchschnitt
--      141625,00

select avg(mittel)
from Projekt
where mittel > 92336.10


-- Aufgabe 4.6
--
-- Ermitteln Sie den höchsten Umsatz, der an einem Tag erzielt wurde.
--
--      umsatz
--      150000,00

select max(umsatz)
from Umsatz

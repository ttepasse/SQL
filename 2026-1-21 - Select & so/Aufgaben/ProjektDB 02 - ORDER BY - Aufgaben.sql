-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu l�sen:


-- ========
-- ORDER BY
-- ========

-- Aufgabe 2.1
--
-- Geben Sie die Firmennamen aller Kunden aus. Sortieren
-- Sie die Ausgabe aufsteigend nach dem Firmennamen.
--
--      firma
--		100% Sonderzeichen AG
--      Finanzamt Ulm
--      Frankreich-Reisen GmbH
--      Getr�nke Schneider
--      Im- und Export AG
--      Technische Produkte oHG

select firma
from Kunde
ORDER BY firma asc



-- Aufgabe 2.2
--
-- Geben Sie alle Ums�tze des Jahres 2019 sortiert nach Datum
-- aus. Bei gleichem Datum sollen die gr��eren Ums�tze zuerst
-- genannt werden.
--
--      id  mit_id  datum       umsatz
--      10  10102   2019-01-01  4500,00
--      17  25348   2019-02-01  150000,00
--      18  25348   2019-03-01  1500,00
--      19  25348   2019-04-01  15,00
--      21  2581    2019-05-01  100000,00
--      20  25348   2019-05-01  150,00

select *
from Umsatz
where year(datum) = 2019
ORDER BY datum asc, umsatz desc



-- Aufgabe 2.3
--
-- Geben Sie alle Daten der Mitarbeiter aus. Sortieren Sie die
-- Ausgabe nach Abteilungs-Nr. aufsteigend. Innerhalb der
-- Abteilung sollen die Mitarbeiter ohne bekannten Wohnort
-- am Ende stehen.
--
--		id     nachname  vorname   abt_id  stadt
--		28559  Mozer     Sibille   a1      Ulm
--		18316  M�ller    Gabriele  a1      Rosenheim
--		29346  Probst    Andreas   a2      Augsburg
--		2581   Kaufmann  Brigitte  a2      NULL
--		9031   Meier     Rainer    a2      NULL
--		25348  Keller    Hans      a3      M�nchen
--		..
--		(15 Zeilen)

select *
from Mitarbeiter
order by abt_id asc, stadt desc



-- Aufgabe 2.4
--
-- Geben Sie die Id und die Aufgabe von allen Mitarbeitern
-- aus, die Projektleiter sind. Sortieren Sie die Ausgabe 
-- nach der Mitarbeiter-Id.
--
--      mit_id  aufgabe
--      2581    Projektleiter
--      5765    Projektleiter
--      10102   Projektleiter
--      22222   Projektleiter

select mit_id, aufgabe
from Arbeit
where aufgabe = 'Projektleiter'
order by mit_id


-- Aufgabe 2.5
--
-- Gesucht werden Mitarbeiter-id, Projekt-Id und Aufgabe 
-- der Mitarbeiter, die entweder im Projekt p2 arbeiten, 
-- oder aber Projektleiter in einem beliebigen Projekt sind.
-- Sortieren Sie die Ausgabe nach der Projekt-Id und dann 
-- nach der Aufgabe.
--
--      mit_id  pro_id  aufgabe
--      10102   p1      Projektleiter
--      18316   p2      NULL
--      29346   p2      NULL
--      25348   p2      Sachbearbeiter
--      28559   p2      Sachbearbeiter
--      2581    p3      Projektleiter
--      5765    p4      Projektleiter
--      22222   p5      Projektleiter

select *
from Arbeit
where pro_id = 'p2' or aufgabe = 'Projektleiter'

order by pro_id asc, aufgabe asc

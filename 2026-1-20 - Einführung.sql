USE ProjektDB;

-- SELECT *
-- FROM Mitarbeiter
-- ORDER BY abt_nr ASC, m_nr DESC;

-- SELECT count(*) AS anzahl
-- FROM Mitarbeiter
-- GROUP BY abt_nr

-- SELECT DISTINCT aufgabe
-- FROM Arbeiten
-- ORDER BY aufgabe DESC

-- SELECT sum(mittel) AS budget
-- FROM Projekt

-- SELECT min(mittel) AS Kleinstes
-- FROM Projekt

-- SELECT avg(mittel) AS Durchschnitt
-- FROM Projekt


-- Hier haben wir AddUmsätze.sql ausgeführt


-- SELECT m_nr AS Mitarbeiter, SUM(umsatz) AS Umsätze
-- FROM Umsatz
-- GROUP BY m_nr
-- HAVING sum(umsatz) >= 100000;

-- SELECT *
-- FROM Umsatz
-- ORDER BY m_nr


-- Unterabfragen

-- SELECT m_vorname, m_name, abt_nr,
-- (
--     SELECT abt_name
--     FROM Abteilung a
--     WHERE a.abt_nr = mi.abt_nr
-- )
-- AS Bezeichnung
-- FROM Mitarbeiter mi;


--  Subselect in der WHERE Anweisung

-- SELECT *
-- FROM Mitarbeiter
-- WHERE abt_nr IN (
--     SELECT abt_nr
--     FROM Abteilung
--     WHERE stadt = 'München'
-- )

select *
from Mitarbeiter m1
where m_nr > (
    select min(m_nr) from Mitarbeiter m2
    where m2.abt_nr = m1.abt_nr
)


-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen:

use ProjektDB

-- =====
-- WHERE
-- =====

-- Aufgabe 1.8
--
-- Finden Sie alle Mitarbeiter, deren Personalnummer 
-- entweder 29346, 28559 oder 25348 ist.
--
--      id     nachname  vorname  abt_id  stadt
--      25348  Keller    Hans     a3      München
--      28559  Mozer     Sibille  a1      Ulm
--      29346  Probst    Andreas  a2      Augsburg

select *
from Mitarbeiter
where id in (29346, 28559, 25348)



-- Aufgabe 1.9
--
-- Nennen Sie alle Mitarbeiter, deren Wohnort 
-- weder München noch Ulm ist.
--
--      id     nachname  vorname   abt_id  stadt
--      5765   Schäfer   Sabine    a3      Landshut
--      9912   Wolf      Klaus     a4      Heidenheim
--      10102  Huber     Petra     a3      Landshut
--      18316  Müller    Gabriele  a1      Rosenheim
--      20204  Fuchs     Dirk      a4      Fürth
--      29346  Probst    Andreas   a2      Augsburg

select *
from Mitarbeiter
where stadt not in (
    'München',
    'Ulm'
)


-- Aufgabe 1.10
--
-- Nennen Sie Namen und Mittel aller Projekte, deren 
-- finanzielle Mittel zwischen 95.000 und 120.000 EURO liegen.
--
--      bezeichnung  mittel
--      Apollo       120000,00
--      Gemini       95000,00

SELECT bezeichnung, mittel
from Projekt
where mittel >= 95000 and mittel <=120000


-- Aufgabe 1.11
--
-- Nennen Sie die Id der Mitarbeiter, die Projektleiter sind 
-- und vor oder nach 2018 in ihren Projekten eingestellt wurden.
--
--      mit_id
--      2581
--      22222

select mit_id, aufgabe, einst_dat
from Arbeit
where aufgabe = 'Projektleiter' and YEAR(einst_dat) >= 2018


-- Aufgabe 1.12
--
-- Finden Sie die Personal- und Projektnummer aller Mitarbeiter, 
-- die in den Projekten p1 oder p5 arbeiten und deren Aufgabe noch 
-- nicht festgelegt ist.
--
--      mit_id  pro_id
--      17000   p1
--      17000   p5
--      28559   p1

select mit_id, pro_id, aufgabe
from Arbeit
where aufgabe is null and pro_id in ('p1', 'p2')


-- Aufgabe 1.13
--
-- Finden Sie die Id und die Aufgabe aller Mitarbeiter,
-- die im Projekt p5 arbeiten, aber nicht Sachbearbeiter sind.
--
--      mit_id  aufgabe
--      17000   NULL
--      22222   Projektleiter

select *
from Arbeit
where pro_id = 'p5' and (aufgabe is null or aufgabe != 'Sachbearbeiter')

-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen:

use ProjektDB

-- ======================
-- Einfache Unterabfragen
-- ======================

-- Aufgabe 5.1
--
-- Nennen Sie Personalnummer und Name des Mitarbeiters 
-- mit der kleinsten Personalnummer. Nutzen Sie eine 
-- einfache Unterabfrage.
--
--      id    nachname
--      2581  Kaufmann

select id, nachname
from Mitarbeiter
where id in (
    select min(id)
    from Mitarbeiter
)



-- Aufgabe 5.2
--
-- Nennen Sie die Abteilungsnummern der Mitarbeiter, die 
-- in Projekt p3 arbeiten. Nutzen Sie eine einfache 
-- Unterabfrage.
--
--      abt_id
--      a2
--      a2
--      a3
--      a5

select abt_id
from Mitarbeiter
where id in (
    select mit_id
    from Arbeit
    where pro_id = 'p3'
)


-- Aufgabe 5.3
--
-- Erstellen Sie eine Liste der Ids aller Mitarbeiter, 
-- deren Gehalt über dem  Durchschnitt liegt. Nutzen 
-- Sie eine einfache Unterabfrage.
--
--      mit_id
--      5765
--      9031
--      17000
--      22222
--      28559
--      29346

select mit_id
from Gehalt
where gehalt > (
    select avg(gehalt)
    from Gehalt
)

-- Aufgabe 5.4
--
-- Nennen Sie die Nummern aller Projekte, in denen Mitarbeiter
-- arbeiten, deren Personalnummer kleiner als die Nummer des 
-- Mitarbeiters namens Müller ist. Nutzen Sie eine einfache 
-- Unterabfrage.
--
--      pro_id
--      p1
--      p3
--      p4
--      p5

select distinct pro_id
from Arbeit
where mit_id < (
    select id
    from Mitarbeiter
    where nachname = 'Müller'
)


-- Aufgabe 5.5
--
-- Nennen Sie die Namen aller Mitarbeiter, die in einer 
-- Abteilung in Ulm arbeiten. Nutzen Sie eine einfache 
-- Unterabfrage.
--
--      nachname  vorname
--      Krüger    Martin
--      Schubert  Rolf
--      Albrecht  Lena

select nachname, vorname, abt_id
from Mitarbeiter
where abt_id in (
    select id
    from Abteilung
    where stadt = 'Ulm'
)


-- Aufgabe 5.6
--
-- Finden Sie die Personalnummer des Projektleiters, 
-- der in dieser Position als letzter einstellt wurde.
-- Nutzen Sie eine einfache Unterabfrage.
--
--      mit_id
--      2581


select mit_id
from Arbeit
where einst_dat = (
    select max(einst_dat)
    from Arbeit
    where aufgabe = 'Projektleiter'
)


-- Aufgabe 5.7
--
-- Nennen Sie die Namen aller Mitarbeiter, die im Projekt "Apollo" 
-- arbeiten. Nutzen Sie zwei verschachtelte Unterabfragen.
--
--      nachname
--      Meier
--      Huber
--      Krüger
--      Mozer
--      Probst

select nachname
from Mitarbeiter
where id in (
    select mit_id
    from Arbeit
    where pro_id = (
        select id
        from Projekt
        where bezeichnung = 'Apollo'
    )
)


-- Aufgabe 5.8
--
-- Zeigen Sie Abteilungsnummer und den Namen der Abteilungen 
-- für die Mitarbeiter an, die am Projekt "Apollo" mitarbeiten. 
-- Nutzen Sie drei verschachtelte Unterabfragen.
--
--      id  bezeichnung
--      a1  Beratung
--      a2  Diagnose
--      a3  Freigabe
--      a5  Verkauf


select id, bezeichnung
from Abteilung
where id in (
    select abt_id
    from Mitarbeiter
    where id in (
        select mit_id
        from Arbeit
        where pro_id = (
            select id
            from Projekt
            where bezeichnung = 'Apollo'
        )
    )
)
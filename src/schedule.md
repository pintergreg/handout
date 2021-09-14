# Ütemezés

Az órák csütörtökönként a BA.F.07-ben vannak (távoktatásban, MS Teams-en), neptun szerint 08:00-10:35 között előadás és 10:45-11:30 között gyakorlat. (Ezek aránya valamint közte a szünet az aktuális előadásanyag és az igények szerint módosulhat). A „gyakorlat” nem labor, hanem sokkal inkább konzultáció!

|hét |dátum      |előadás                    |gyakorlat                                                               |előadó[^1]  |
|---:|:---------:|:-------------------------:|:----------------------------------------------------------------------:|:-----------|
|  1.|  09. 09.  | Bevezető, áttekintés      | feladat és a munkafolyamat átfogó ismertetése                          | PG         |
|  2.|  09. 16.  | Napi munka, verziókezelők | git, GitHub, IDE ismertetés                                            | PI, PG     |
|  3.|  09. 23.  | Software Architecture     | csapatsorsolás, első sprint: Sprint Planning, Task Definition Workshop | RL, PI, PG |
|  4.|  09. 30.  | TDD, Unit Testing         | TDD kata, konzultáció                                                  | PI, PG     |
|  5.|  10. 07.  | Agile, SCRUM, Kanban      | konzultáció                                                            | PI, PG     |
|  6.|  10. 14.  | TBD                       | konzultáció                                                            | RL, PI, PG |
|  7.|  10. 21.  | Legacy Code, SOLID,       | Random code review egy tetszőleges elfogadott pull requestből          | RL, PI, PG |
|  8.|**10. 28.**| Review, **1. demo**       | retrospektív, második sprint: Sprint Planning, Task Definition Workshop| PI, PG     |
|  9.|  11. 04.  | Continous Integration     | konzultáció                                                            | RL, PI, PG |
| 10.|  11. 11.  | TBD                       | konzultáció                                                            | RL, PI, PG |
| 11.|  11. 18.  | Rektori/dékáni szünet     | opcionális online konzultáció                                          | ?PG        |
| 12.|**11. 25.**| Összefoglalás, **2. demo**| retrospektív, tárgy feedback                                           | PI, PG     |
| 13.|**12. 02.**| **Zárthelyi dolgozat**[^2]|                                                                        |            |
| 14.|  12. 10.  |                           |                                                                        |            |

- [^1] Előadók: Ravasz László (RL), Petrovics István (PI), Pintér Gergő (PG)
- [^2] ZH: Moodle, a teszt 08:00-tól 12:00-ig indítható, 70 perc van a kitöltésre

## Gantt diagram


<div class="mermaid">
    gantt
    dateFormat  YYYY-MM-DD
    axisFormat  %m-%d
    title 2021/22 tanév I.félév
    Introduction :milestone, 2021-09-09, 1d
    section Warm-up
        Warm-up :active, warmup, 2021-09-16, 1w
    Team draw :milestone, after warmup, 1d
    section Sprint 1
        Sprint 1 :active, sprint1, after warmup, 4w
    Demo 1 :milestone, after sprint1, 1d
    section Sprint 2
        Sprint 2 :active, sprint2, after sprint1, 4w
    Demo 2 :milestone, after sprint2, 1d
    Midterm :milestone, 2021-12-02, 1d
    click sprint1 href "./sprint_1.html"
    click sprint2 href "./sprint_2.html"
</div>


<!--
# Házi feladat - 1. hét

1. GitHub fiók létrehozása
    * ha még nincs
2. 11 JDK telepítése, mivel a szoftvert Java nyelven kell elkészíteni
    * ha nincs fönt
3. Fejlesztőkörnyezet telepítése és beállítása
    * IntelliJ IDEA az ajánlott és támogatott eszköz
4. Git és GitHub oktatóanyagok elolvasása
    * ha vannak hiányosságok
    * az órán nincs idő szájbarágósan git használatot oktatni, erre vannak interaktív oktatófelületek
    * ez mindenkinek egyéni felelőssége, ám ha konkrét kérdések merülnek fel, akkor ezekre természetesen kitérünk
5. Git repó klónozása
6. Kód futtatása a futtató- és a fejlesztőkörnyezet beállításainak tesztelése céljából
7. A jegyzet és az abban taglalt segédanyagok megismerése
8. Az elkészítendő szoftver átgondolása (lásd readme), statikus és dinamikus modell elkészítése komponens szinten
    * Ennek terjedelme (az órái példa alapján): egy absztrakciós szint a négyfelé bontás (kb. user story szint), és egy az ez alatti egyel, minden komponens még egy kibontása, kb. egyenrangú komponensek létrehozására - osztály szintre nem mennék le, még ha a végén ezekből akár osztály is lesz. Szóval kettő struktúra, kettő dinamikus viselkedést leíró diagram, egy magasabb és egy alacsonyabb absztrakciós szinten. Hogy konkrétan hány building block, azt mindenkinek "érzésre" kell megállapítania, ezért szubjektív az architektúra.
    * Ez egy egyéni feladat, hiszen még nincsenek csapatok. Az elkészítéshez javasolt eszközök: MS Visio, https://www.draw.io/.
    * Az elkészült diagramoknak a következő órán bemutatható állapotban kell lenniük.
-->



# Demók

A félév során a csapatok három alkalommal prezentálják az elvégzett munkát. A „demók” az _elkészült_ szoftver megrendelőnek való bemutatását szimulálják. Nem a kódra vagyunk kíváncsiak, hanem működés közben szeretnénk látni, hogy a szoftver teljesíti feladatban foglalt követelményeket.
A bemutatás során, a `master` branchre befogadott kódot vesszük figyelembe, minden egyéb _„nem készült el határidőre”_, azaz értékelhetetlen.

[Bővebben...](demo.md)


# Zárthelyi

Ismert, Moodle-ös teszt, 50 kérdéssel, erre 70 perc áll majd a rendelkezésre. Minden kérdéshez 4 válaszlehetőség, amelyek közül pontosan egy a helyes. (Vannak „az alábbiak közül melyik NEM helyes” felépítésű kérdések is.) A rendelkezésre álló idő alatt kérdéseket tetszőleges alkalommal felül lehet vizsgálni, módosítani a teszt „lezárása” után azonnal kiértékelésre is kerül.

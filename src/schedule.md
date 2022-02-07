# Ütemezés

Az órák csütörtökönként a BA.F.07-ben vannak (távoktatásban, MS Teams-en), neptun szerint 08:00-10:35 között előadás és 10:45-11:30 között gyakorlat. (Ezek aránya valamint közte a szünet az aktuális előadásanyag és az igények szerint módosulhat). A „gyakorlat” nem labor, hanem sokkal inkább konzultáció!

|hét |dátum      |előadás                    |gyakorlat                                                               |
|---:|:---------:|:-------------------------:|:----------------------------------------------------------------------:|
|  1.|  02. 10.  | Bevezető, áttekintés      | feladat és a munkafolyamat átfogó ismertetése                          |
|  2.|  02. 17.  | Napi munka, verziókezelők | git, GitHub, IDE ismertetés                                            |
|  3.|  02. 24.  | Software Architecture I.  | csapatsorsolás, warmup                                                 |
|  4.|  03. 03.  | Software Architecture II. | Sprint Planning, Task Definition Workshop                              |
|  5.|  03. 10.  | Agile, SCRUM, Kanban      | konzultáció (hozott UML-k megbeszélése)                                |
|  6.|  03. 17.  | Verification & validation | konzultáció                                                            |
|  7.|  03. 24.  | Continuous Integration    | nálunk hogy működik (handout, AutomatedCar), konzultáció               |
|  8.|**03. 31.**| **1. demo**               | retrospektív, Sprint Planning, Task Definition Workshop                |
|  9.|  04. 07.  | Review                    | PR review, konzultáció                                                 |
| 10.|  04. 14.  | Rektori/dékáni szünet     |                                                                        |
| 11.|  04. 21.  | Legacy Code               | konzultáció                                                            |
| 13.|  04. 28.  | TBD                       |                                                                        |
| 12.|**05. 05.**| Összefoglalás, **2. demo**| retrospektív, tárgy feedback                                           |
| 14.|**05. 12.**| **Zárthelyi dolgozat**    |                                                                        |


## Házi feladatok

hét| feladat
---|--------
1  | [Avalonia Tutorial teljesítése](https://docs.avaloniaui.net/tutorials/todo-list-app)
3  | Warmup feladat
4  | modul tervezése, UML (statikus és dinamikus) készítése és feltöltése GitHubra


## Gantt diagram

<div class="mermaid">
    gantt
    dateFormat  YYYY-MM-DD
    axisFormat  %m-%d
    title 2021/22 tanév II.félév
    Introduction :milestone, 2022-02-10, 1d
    section Warm-up
        Warm-up :active, warmup, 2022-02-24, 1w
    Team draw :milestone, after warmup, 1d
    section Sprint 1
        Sprint 1 :active, sprint1, after warmup, 4w
    Demo 1 :milestone, after sprint1, 1d
    section Sprint 2
        Sprint 2 :active, sprint2, after sprint1, 4w
    Demo 2 :milestone, after sprint2, 1d
    Midterm :milestone, 2022-05-12, 1d
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

A félév során a csapatok két alkalommal prezentálják az elvégzett munkát. A „demók” az _elkészült_ szoftver megrendelőnek való bemutatását szimulálják. Nem a kódra vagyunk kíváncsiak, hanem működés közben szeretnénk látni, hogy a szoftver teljesíti feladatban foglalt követelményeket.
A bemutatás során, a `master` branchre befogadott kódot vesszük figyelembe, minden egyéb _„nem készült el határidőre”_, azaz értékelhetetlen.

[Bővebben...](demo.md)


# Zárthelyi

Ismert, Moodle-ös teszt, 50 kérdéssel, erre 70 perc áll majd a rendelkezésre. Minden kérdéshez 4 válaszlehetőség, amelyek közül pontosan egy a helyes. (Vannak „az alábbiak közül melyik NEM helyes” felépítésű kérdések is.) A rendelkezésre álló idő alatt kérdéseket tetszőleges alkalommal felül lehet vizsgálni, módosítani a teszt „lezárása” után azonnal kiértékelésre is kerül.


# Jegy kialakítása

1. gyakorlati jegy (sprintek átlaga) × 0.7 + ZH jegy × 0.3

2. Ha nincs gyakorlati teljesítmény, akkor a félév elégtelen, függetlenül attól, hogy a ZH hogy sikerült.
3. Mivel a sprintekre csapatok kapnak jegyet, mindenki kitölt egy csapattárs értékelő kérdőívet arról, hogy a csapaton belüli munka miképpen oszlott meg.

A ZH százalék jegyre számítását az alábbi intervallumokkal végezzük:

tól | ig | jegy
-- | --- | --
 0 |  49 | 1
50 |  59 | 2
60 |  69 | 3
70 |  79 | 4
80 | 100 | 5

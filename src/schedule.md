# Ütemezés

Az órák csütörtökönként a ~~BA.F.07-ben vannak~~ ([online, MS Teams-en](https://teams.microsoft.com/l/team/19%3ac7cf754b3c92495bb1799aa81597d88a%40thread.tacv2/conversations?groupId=a56552c3-1b48-44d8-af21-7ac594aa9009&tenantId=1d6a56fa-705a-4bbc-8004-67a21d5e9b97)), neptun szerint 08:00-10:35 között előadás és 10:45-11:30 között gyakorlat. (Ezek aránya valamint közte a szünet az aktuális előadásanyag és az igények szerint módosulhat). A „gyakorlat” nem labor, hanem sokkal inkább konzultáció!

|hét    |dátum        |előadás|gyakorlat|
|------:|:-----------:|:-----:|:-------:|
| 1.|02.&nbsp;11.| Bevezető, áttekintés, [aSpice&nbsp;alapok](https://www.lhpes.com/blog/what-is-aspice-in-automotive); [Software Architecture](lectures/software_architecture.md) | csapatsorsolás, [első feladat kiadás](sprint_1.md), Sprint Planning, Task Definition Workshop, Team commitment, Scheduling
| 2.|02.&nbsp;18.| [Napi munka, verziókezelők](lectures/daily_work.md)|Branch review, status review, standup (did, will, blocking)
| 3.|02.&nbsp;25.| [Agile, SCRUM, Kanban](lectures/agile_scrum_kanban.md) | git, GitHub, IDEA ismertetés
| 4.|03.&nbsp;04.| [TDD, Unit Testing](lectures/tdd.md) | TDD kata
| 5.|**03.&nbsp;11.**| **első demo**, retrospektív|[második feladat kiadás](sprint_2.md), Sprint planning, Task Definition Workshop, Team commitment, Scheduling
| 6.|03.&nbsp;18.| [Legacy Code, SOLID](lectures/legacy_code.md) |Refactoring gyakorlat egy előre előkészített példán
| 7.|03.&nbsp;25.| [Review](lectures/review.md) |Random code review egy tetszőleges elfogadott pull requestből
| 8.|04.&nbsp;01.| Rektori/dékáni szünet
| 9.|**04.&nbsp;08.**| [Continous Integration](lectures/ci.md), **második demo**, retrospektív | [harmadik feladat kiadás](sprint_3.md), Sprint planning, Task Definition Workshop, Team commitment, Scheduling; Set up a CI script running all implemented unit tests
|10.|04.&nbsp;15.|
|11.|04.&nbsp;22.| Rektori/dékáni szünet
|12.|04.&nbsp;29.| konzultáció (előtte nap TDK)
|13.|**05.&nbsp;06.**| Összefoglalás, **harmadik demo**, retrospektív, tárgy feedback | Pair programming, Coding Dojo
|14.|**05.&nbsp;13.**| **Zárthelyi dolgozat** Moodle, a teszt 08:00-tól 12:00-ig indítható, 70 perc van a kitöltésre


## Gantt diagram


<div class="mermaid">
    gantt
    dateFormat  YYYY-MM-DD
    axisFormat  %m-%d
    title 2020/21 tanév II.félév
    section Sprint 1
        Sprint 1 :active, sprint1, 2021-02-11, 4w
    section Sprint 2
        Sprint 2 :active, sprint2, after sprint1, 4w
    section Sprint 3
        Sprint 3 :active, sprint3, after sprint2, 4w
    click sprint1 href "./sprint_1.html"
    click sprint2 href "./sprint_2.html"
    click sprint3 href "./sprint_3.html"
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


# Zárthelyi

Ismert, Moodle-ös teszt, 50 kérdéssel, erre 70 perc áll majd a rendelkezésre. Minden kérdéshez 4 válaszlehetőség, amelyek közül pontosan egy a helyes. (Vannak „az alábbiak közül melyik NEM helyes” felépítésű kérdések is.) A rendelkezésre álló idő alatt kérdéseket tetszőleges alkalommal felül lehet vizsgálni, módosítani a teszt „lezárása” után azonnal kiértékelésre is kerül.

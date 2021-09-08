# Ütemezés

Az órák csütörtökönként a BA.F.07-ben vannak (távoktatásban, MS Teams-en), neptun szerint 08:00-10:35 között előadás és 10:45-11:30 között gyakorlat. (Ezek aránya valamint közte a szünet az aktuális előadásanyag és az igények szerint módosulhat). A „gyakorlat” nem labor, hanem sokkal inkább konzultáció!

|hét    |dátum        |előadás|gyakorlat|
|------:|:-----------:|:-----:|:-------:|
| 1.|09.&nbsp;09.| Bevezető, áttekintés, [aSpice&nbsp;alapok](https://www.lhpes.com/blog/what-is-aspice-in-automotive) | feladat és az eszközök átfogó ismertetése
| 2.|09.&nbsp;16.| [Software Architecture](lectures/software_architecture.md); [Napi munka, verziókezelők](lectures/daily_work.md)|csapatsorsolás, [első feladat kiadás](sprint_1.md), Sprint Planning, Task Definition Workshop, Team commitment, Scheduling, standup (did, will, blocking)
| 3.|09.&nbsp;23.| [Agile, SCRUM, Kanban](lectures/agile_scrum_kanban.md) | git, GitHub, IDEA ismertetés
| 4.|09.&nbsp;30.| [TDD, Unit Testing](lectures/tdd.md) | TDD kata
| 5.|**10.&nbsp;07.**| **első demo**, retrospektív|[második feladat kiadás](sprint_2.md), Sprint planning, Task Definition Workshop, Team commitment, Scheduling
| 6.|10.&nbsp;14.| [Legacy Code, SOLID](lectures/legacy_code.md) |Refactoring gyakorlat egy előre előkészített példán
| 7.|10.&nbsp;21.| [Review](lectures/review.md) |Random code review egy tetszőleges elfogadott pull requestből
| 8.|10.&nbsp;28.| Rektori/dékáni szünet
| 9.|**11.&nbsp;04.**| [Continous Integration](lectures/ci.md), **második demo**, retrospektív | [harmadik feladat kiadás](sprint_3.md), Sprint planning, Task Definition Workshop, Team commitment, Scheduling; Set up a CI script running all implemented unit tests
|10.|11.&nbsp;11.|
|11.|11.&nbsp;18.| Rektori/dékáni szünet
|12.|11.&nbsp;25.| konzultáció (előtte nap TDK)
|13.|**12.&nbsp;02.**| Összefoglalás, **harmadik demo**, retrospektív, tárgy feedback | Pair programming, Coding Dojo
|14.|**12.&nbsp;10.**| **Zárthelyi dolgozat** Moodle, a teszt 08:00-tól 12:00-ig indítható, 70 perc van a kitöltésre


## Gantt diagram


<div class="mermaid">
    gantt
    dateFormat  YYYY-MM-DD
    axisFormat  %m-%d
    title 2021/22 tanév I.félév
    section Sprint 1
        Sprint 1 :active, sprint1, 2021-09-09, 4w
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

## Ideális eset az első sprint után

A „megrendelő” az aktuális master branchről elindítja a szoftvert, az ablak bal oldalán ott van az autó (középen), az út fölé helyezve, jobb oldalon a műszerfal mutatja az állapotát. Sebességbe teszi az autót, majd gázt ad, elindul, kicsit mászkál a világban, teszteli a gyorsulás, lassulás és kanyarodás „érzetét”, közben megfigyeli a pálya illesztéseit és a „grafika folytonosságát”.
Még kipróbálja a debug funkciókat és egyéb kapcsolót a rend kedvéért.

**konklúzió**: a pálya hibátlanul kirajzolásra került, emögött *vélhetően* van egy modell világ, hiszen a poligonok is rendben a helyükön vannak, az autó mozgása „rendben van”, nem volt cél egy profi autószimulátor szintű fizika, ha a sebesség-változások és a fordulás nem mutat kiugró rendellenességet, az autó pontosan vezethető (érts, végre tudok hajtani pl. egy párhuzamos parkolást), és a műszerfal közvetíti azt amit látunk, akkor mind a 4 csapat kifogástalan munkát végzett, mindenki teljesítménye 5-ös, lehet foglalkozni érdekesebb témákkal.


# Zárthelyi

Ismert, Moodle-ös teszt, 50 kérdéssel, erre 70 perc áll majd a rendelkezésre. Minden kérdéshez 4 válaszlehetőség, amelyek közül pontosan egy a helyes. (Vannak „az alábbiak közül melyik NEM helyes” felépítésű kérdések is.) A rendelkezésre álló idő alatt kérdéseket tetszőleges alkalommal felül lehet vizsgálni, módosítani a teszt „lezárása” után azonnal kiértékelésre is kerül.

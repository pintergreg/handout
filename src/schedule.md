# Ütemezés

Az órák csütörtökönként a BA.F.09-ban vannak, neptun szerint 08:00-10:35 között előadás és 10:45-11:30 között gyakorlat. (Ezek aránya valamint közte a szünet az aktuális előadásanyag és az igények szerint módosulhat). A „gyakorlat” nem labor, hanem sokkal inkább konzultáció!

|hét    |dátum        |előadás|gyakorlat|
|------:|:-----------:|:-----:|:-------:|
| 1.|02.&nbsp;13.|Bevezető, áttekintés; aSpice alapok, [első feladat kiadás](sprint_1.md)|csapatsorsolás, Sprint Planning, Task Definition Workshop, Team commitment, Scheduling
| 2.|02.&nbsp;20.|Agile/Scrum | git, GitHub, IDEA ismertetés
| 3.|02.&nbsp;27.|Napi munka, verziókezelők|Branch review, status review, standup (did, will, blocking)
| 4.|03.&nbsp;05.|Unit Testing|TDD kata
| <s>5.</s>|<s>03.&nbsp;12.</s>| Koronavírus szünet
| <s>6.</s>|<s>03.&nbsp;19.</s>| Koronavírus szünet
| 6.|03.&nbsp;26.| **első demo**/retrospektív, [második feladat kiadás](sprint_2.md)|Sprint planning, Task Definition Workshop, Team commitment, Scheduling
| 7.|04.&nbsp;02.| Legacy Code, SOLID|Refactoring gyakorlat egy előre előkészített példán
| 8.|04.&nbsp;09.| Review|Random code review egy tetszőleges elfogadott pull requestből
| 9.|04.&nbsp;16.| Continous Integration, **második demo**/retrospektív, [harmadik feladat kiadás](sprint_3.md)|Set up a CI script running all implemented unit tests, Sprint planning, Task Definition Workshop, Team commitment, Scheduling
|10.|04.&nbsp;23.| Software Architecture
|11.|04.&nbsp;30.| Konzultáció
|12.|05.&nbsp;07.| Konzultáció
|13.|**05.&nbsp;14.**|**harmadik demo**/retrospektív, Összefoglalás, konzultáció, tárgy feedback|Retro + Pair programming, Coding Dojo
|14.|**05.&nbsp;21.**|**Zárthelyi dolgozat** 08:00-tól 09:30-ig (90 perc), 1.?? és 1.?? laborok

[Rektori utasítás a félév zárásáról](http://uni-obuda.hu/files/private/order/24468/3-2020-3_2020_rektori-utasitas-20200422.pdf)

## Gantt diagram


<div class="mermaid">
    gantt
    dateFormat  YYYY-MM-DD
    axisFormat  %m-%d
    title 2019/20 tanév II.félév
    section Sprint 1
        Sprint 1 :active, sprint1, 2020-02-13, 4w
    section COVID-19 break
        NO LECTURES :crit, break, after sprint1, 2w
    section Sprint 1 (continued)
        Sprint 1 :active, sprint1_cont, after break, 1w
    section Sprint 2
        Sprint 2 :active, sprint2, after sprint1_cont, 3w
    section Sprint 3
        Sprint 3 :active, sprint3, after sprint2, 3w
    click sprint1 href "./sprint_1.html"
    click sprint1_cont href "./sprint_1.html"
    click sprint2 href "./sprint_2.html"
    click sprint3 href "./sprint_3.html"
</div>


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



# Demók

A félév során a csapatok három alkalommal prezentálják az elvégzett munkát. A „demók” az _elkészült_ szoftver megrendelőnek való bemutatását szimulálják. Nem a kódra vagyunk kíváncsiak, hanem működés közben szeretnénk látni, hogy a szoftver teljesíti feladatban foglalt követelményeket.
A bemutatás során, a `master` branchre befogadott kódot vesszük figyelembe, minden egyéb _„nem készült el határidőre”_, azaz értékelhetetlen.


# Zárthelyi

Ismert, Moodle-ös teszt, 50 kérdéssel, erre 90 perc áll majd a rendelkezésre. Minden kérdéshez 4 válaszlehetőség, amelyek közül pontosan egy a helyes. (Vannak „az alábbiak közül melyik NEM helyes” felépítésű kérdések is.) A rendelkezésre álló idő alatt kérdéseket tetszőleges alkalommal felül lehet vizsgálni, módosítani a teszt „lezárása” után azonnal kiértékelésre is kerül.

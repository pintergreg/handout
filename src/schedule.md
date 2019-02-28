# Ütemezés

Az órák csütörtökönként a BA.F.06-ban vannak, neptun szerint 08:00-10:35 között előadás és 10:45-11:30 között gyakorlat. (Ezek aránya valamint közte a szünet az aktuális előadásanyag és az igények szerint módosulhat). A „gyakorlat” nem labor, hanem sokkal inkább konzultáció!

|hét    |dátum        |előadás|gyakorlat|
|------:|:-----------:|:-----:|:-------:|
| 1.|02.&nbsp;14.|Bevezető, áttekintés; aSpice alapok|git, GitHub, IDEA ismertetés,
| 2.|02.&nbsp;21.|Agile/Scrum, [első feladat kiadás](sprint_1.md)|csapatsorsolás, Sprint Planning, Task Definition Workshop, Team commitment, Scheduling
| 3.|02.&nbsp;28.|Napi munka, verziókezelők|Branch review, status review, standup (did, will, blocking)
| 4.|03.&nbsp;07.|Unit Testing|Status review, standup, TDD kata
| 5.|03.&nbsp;14.|Legacy Code, SOLID|Refactoring gyakorlat egy előre előkészített példán
| **6.**|**03.&nbsp;21.**|**első demo**/retrospektív, [második feladat kiadás](sprint_2.md)|Sprint planning, Task Definition Workshop, Team commitment, Scheduling
| 7.|03.&nbsp;28.|Review|Random code review egy tetszőleges elfogadott pull requestből
| 8.|04.&nbsp;04.|TBD
| **9.**|**04. 11.**|**második demo**/retrospektív, [harmadik feladat kiadás](sprint_3.md)|Sprint planning, Task Definition Workshop, Team commitment, Scheduling
|10.|04.&nbsp;18.|_Rektori/dékáni szünet_
|11.|04.&nbsp;25.|Continous Integration|Set up a CI script running all implemented unit tests
|12.|05.&nbsp;02.|Összefoglalás, konzultáció, tárgy feedback|Retro + Pair programming
|**13.**|**05.&nbsp;09.**|**harmadik demo**/retrospektív|Coding Dojo, feedback
|**14.**|**05.&nbsp;16.**|**Zárthelyi dolgozat** ??:??-tól ??:??-ig (90 perc), 1.?? és 1.?? laborok

## Gantt diagram

![gantt](images/gantt.png)


# Házi feladat - 1. hét

1. GitHub fiók létrehozása
    * ha még nincs
2. 11 JDK telepítése
    * ha nincs fönt
3. Fejlesztőkörnyezet telepítése és beállítása
4. Git és GitHub oktatóanyagok elolvasása
    * ha vannak hiányosságok
5. Git repó klónozása
6. Kód futtatása a fejlesztő környezet beállításainak tesztelése céljából
7. A jegyzet és az abban taglalt segédanyagok megismerése
8. Az elkészítendő szoftver átgondolása
    1. use-case diagram
    2. rendszerszintű, absztrakt elemek
    3. a fentiek komponens szintű kibontása
    4. egy, az egyéni értékelés szerint legnagyobb jelentőséggel bíró komponens osztálydiagramja
        - alternatívaként a legszimpatikusabb komponens


# Demók

A félév során a csapatok három alkalommal prezentálják az elvégzett munkát. A „demók” az _elkészült_ szoftver megrendelőnek való bemutatását szimulálják. Nem a kódra vagyunk kíváncsiak, hanem működés közben szeretnénk látni, hogy a szoftver teljesíti feladatban foglalt követelményeket.
A bemutatás során, a `master` branchre befogadott kódot vesszük figyelembe, minden egyéb _„nem készült el határidőre”_, azaz értékelhetetlen.


# Zárthelyi

Ismert, Moodle-ös teszt, 50 kérdéssel, erre 90 perc áll majd a rendelkezésre. Minden kérdéshez 4 válaszlehetőség, amelyek közül pontosan egy a helyes. (Vannak „az alábbiak közül melyik NEM helyes” felépítésű kérdések is.) A rendelkezésre álló idő alatt kérdéseket tetszőleges alkalommal felül lehet vizsgálni, módosítani a teszt „lezárása” után azonnal kiértékelésre is kerül.
